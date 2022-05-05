#!/bin/bash

version=$1
shift
echo ${version}

pushd /bluemind

rm -rf /usr/share/bj-eclipse
curl -o /bluemind/eclipse-indigo.tgz http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/indigo/SR2/eclipse-rcp-indigo-SR2-linux-gtk-x86_64.tar.gz
mkdir -p /usr/share/bj-eclipse
tar --strip-components 1 -C /usr/share/bj-eclipse -xzvf /bluemind/eclipse-indigo.tgz
rm -f /bluemind/eclipse-indigo.tgz

rm -rf /usr/share/bj-gwt
curl -o /bluemind/gwt-2.5.0.zip https://google-web-toolkit.googlecode.com/files/gwt-2.5.0.zip
unzip /bluemind/gwt-2.5.0.zip -d /tmp
mv /tmp/gwt-2.5.0 /usr/share/bj-gwt
rm -f /bluemind/gwt-2.5.0.zip

git clone http://git.blue-mind.net/ bluemind
ln -s bluemind open

pushd /bluemind/bluemind
git checkout -f -b build ${version}

tar -C /usr/lib/jvm -xjvf jdk/bm-jdk.tar.bz2

BO_DISPLAY_NAME=${version}
export BO_DISPLAY_NAME

sed -i -e 's/ bj-eclipse, bj-gwt,//' debian/control
sed -i -e 's#bm-setup-wizard (= ${binary\:Version})|bm-installation-wizard (= ${binary:Version}), ##' debian/control
sed -i -e 's/^\(ssh.\+\)$/#\1/' ci/hudson.sh
WORKSPACE=/bluemind /bluemind/open/ci/hudson.sh

exec $@
