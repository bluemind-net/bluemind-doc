#!/bin/bash

function usage {
        echo "$0 USER|MAILSHARE EMAIL_ADDRESS_SOURCE BACKUP_PATH USER|MAILSHARE EMAIL_ADDRESS_DEST"
        echo "  * BACKUP_PATH for user should be the root of the user data mailbox, for mailshare it should be the directory that contains the first letter level"
}

function check_params {
        if [ "$1" != "USER" ] && [ "$1" != "MAILSHARE" ] ; then
                echo "Invalid type parameter, use USER or MAILSHARE"
                exit 1
        else
                TYPE_SOURCE=$1
        fi

        LOGIN_SOURCE=`echo $2 | cut -d'@' -f1 | tr '.' '^'`

        if [ ! -d "$3" ]; then
                echo "Invalid BACKUP_PATH"
                exit 1
        fi

        if [ "$4" != "USER" ] && [ "$4" != "MAILSHARE" ] ; then
                echo "Invalid type parameter, use USER or MAILSHARE"
                exit 1
        else
                TYPE_DEST=$4
        fi

        # to do check if backup part really contains the data
        # check email _address
        LOGIN_DEST=`echo $5 | cut -d'@' -f1 | tr '.' '^'`
        DOMAIN=$(grep $5 /etc/postfix/virtual_alias-flat | awk '{print $2}' | cut -d@ -f2 2>/dev/null)
        if [ -z $DOMAIN ]; then
                echo "DOMAIN not found"
                exit 1
        fi
}

function first_letter {
        letter=${1:0:1}
        if [ -n "$letter" ] && [ "$letter" -eq "$letter" ] 2>/dev/null; then
                echo "q"
        else
                echo "$letter"
        fi
}

function get_partition {
        domain=$(echo $1|tr '.' '_')
        cat /etc/cyrus-partitions | grep $domain | grep -E "^partition" | cut -d: -f1 | sed s/partition-//g
}

function get_partition_path {
        domain=$(echo $1|tr '.' '_')
        cat /etc/cyrus-partitions | grep $domain | grep -E "^partition" | cut -d: -f2
}

function get_data_spool_directory {
        if [ $TYPE_DEST = "USER" ]; then
                echo "$partition_path/domain/$first_letter_domain/$DOMAIN/$first_letter_login_dest/user/$LOGIN_DEST"
        else
                echo "$partition_path/domain/$first_letter_domain/$DOMAIN/r/$LOGIN_DEST"
        fi
}

function get_meta_path {
        echo ${1/data/meta}
}

if [ "$#" -ne 5 ]; then
        usage
        exit 1
fi

check_params $1 $2 $3 $4 $5

pushd ./

# init variables
partition=$(get_partition $DOMAIN)
partition_path=$(get_partition_path $DOMAIN)
first_letter_domain=$(first_letter $DOMAIN)
first_letter_login_dest=$(first_letter $LOGIN_DEST)
data_spool=$(get_data_spool_directory)
meta_spool=$(get_meta_path $data_spool)
restored_date=`date +%Y-%m-%d-%H-%M-%S`
restored_directory="restored-${LOGIN_SOURCE/^/_}-${restored_date}"
backup_data_path=$3
backup_meta_path=$(get_meta_path $backup_data_path)
reconstruct=$(which reconstruct)
quota=$(which quota)

if [ -z $partition ]; then
        echo "partition not found"
        exit 1
fi

echo "Parameters used :"
echo "type_source : $TYPE_SOURCE"
echo "type_dest : $TYPE_DEST"
echo "login_source : $LOGIN_SOURCE"
echo "login_dest : $LOGIN_DEST"
echo "domain : $DOMAIN"
echo "partition : $partition"
echo "partition_path : $partition_path"
echo "data_spool : $data_spool"
echo "meta_spool : $meta_spool"
echo "restored_directory : $restored_directory"
echo "backup_data_path : $backup_data_path"
echo "backup_meta_path : $backup_meta_path"

# create restored folder
mkdir -vp "${data_spool}/${restored_directory}"
chown cyrus:mail ${data_spool}/${restored_directory}

mkdir -vp "${meta_spool}/${restored_directory}"
chown cyrus:mail ${meta_spool}/${restored_directory}

touch ${meta_spool}/${restored_directory}/cyrus.header
chown cyrus:mail ${meta_spool}/${restored_directory}/cyrus.header

# restore data
cd $backup_data_path
echo "Copy emails"
if [ $TYPE_SOURCE = "USER" ]; then
        cp -var *  "$data_spool/$restored_directory/"
else
        find ./ -maxdepth 3 -type d -wholename "*/$LOGIN_SOURCE" -exec cp -var {} "$data_spool/$restored_directory/" \;

fi
chown -R cyrus:mail $data_spool/$restored_directory

# restore meta
cd $backup_meta_path
if [ $TYPE_SOURCE = "USER" ]; then
        cp -var *  "$meta_spool/$restored_directory/"
else
        find ./ -maxdepth 3 -type d -wholename "*/$LOGIN_SOURCE" -exec cp -var {} "$meta_spool/$restored_directory/" \;
fi

# restore without meta
#cd "$data_spool/$restored_directory/"
#find ./ -type d -exec mkdir "$meta_spool/$restored_directory/{}" \;
#cd "$meta_spool/$restored_directory/"
#find ./ -type d -exec touch {}/cyrus.header \;

chown -R cyrus:mail $meta_spool/$restored_directory

# Check if sub-folders in INBOX exist
if [ -d "$data_spool/$restored_directory/INBOX" ]; then
        mv -v $data_spool/$restored_directory/{INBOX,IN}
        mv -v $meta_spool/$restored_directory/{INBOX,IN}
        touch ${meta_spool}/${restored_directory}/IN/cyrus.header
        chown cyrus:mail ${meta_spool}/${restored_directory}/IN/cyrus.header
fi

# reconstruct
if [ $TYPE_DEST = "USER" ]; then
        $reconstruct -p $partition -G -f -r "user/${LOGIN_DEST/^/.}/$restored_directory@$DOMAIN"
        $quota -d $DOMAIN user.$LOGIN_DEST
else
        $reconstruct -p $partition -G -f -r "${LOGIN_DEST/^/.}/$restored_directory@$DOMAIN"
fi

popd

bm-cli maintenance repair --ops mailboxAcls $5
echo "Restoration done."
exit 0
