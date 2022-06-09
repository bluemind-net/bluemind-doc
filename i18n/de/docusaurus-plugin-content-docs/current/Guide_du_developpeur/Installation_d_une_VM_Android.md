---
title: "Installieren einer Android-VM"
confluence_id: 62559016
position: 52
---
# Installieren einer Android-VM


## Präsentation

Diese Seite führt Sie durch die Installation einer virtuellen Android-Umgebung unter Linux.

Wenn Sie Android Studio (rich IDE) nicht benötigen, können Sie nur das Nötigste installieren, um eine virtuelle Android-Maschine einzurichten.


:::info

Alle Informationen zu den Kommandozeilen-Tools sind online zu finden: https: [//developer.android.com/studio/command-line](https://developer.android.com/studio/command-line)

:::


## Voraussetzung

Bevor die virtuelle Maschine selbst installiert wird, müssen eine Reihe von Umgebungsvariablen eingerichtet und *sdkmanager* installiert werden.

Nachfolgend die Aktionen, die entsprechend Ihrer Distribution auszuführen sind (generische Aktionen, entsprechende Befehle für bestimmte Distributionen).

### Generisches Linux

1. Installieren Sie Java 8, genauer gesagt openjdk-8 (siehe [https://doc.ubuntu-fr.org/java](https://doc.ubuntu-fr.org/java))
2. Download der Kommandozeilen-Tools: https: [//developer.android.com/studio#command-tools](https://developer.android.com/studio#command-tools)
3. Den Inhalt dekomprimieren in `/opt/android-sdk`
    1. `sudo mkdir -p /opt/android-sdk`
4. Umgebungsvariablen einrichten (siehe [https://doc.ubuntu-fr.org/variables_d_environnement#variables_d_environnement_persistantes](https://doc.ubuntu-fr.org/variables_d_environnement#variables_d_environnement_persistantes)):
    1. `**ANDROID\_SDK\_ROOT=/opt/android-sdk**`
    2. zu **`PATH`** hinzufügen:
        1. `/opt/android-sdk/emulator`
        2. `/opt/android-sdk/platform-tools`
        3. `/opt/android-sdk/tools/bin`
5. Die Ordner-Rechte für die Gruppe `android-sdk` vergeben
    1. `groupadd android-sdk`
    2. `gpasswd -a $USER android-sdk`
    3. `setfacl -R -m g:android-sdk:rwx /opt/android-sdk`
    4. `setfacl -d -m g:android-sdk:rwX /opt/android-sdk`
    5. `chown :android-sdk /opt/android-sdk -R`
    6. `chmod u+w /opt/android-sdk`
6. ⚠️ Loggen Sie sich erneut ein oder führen Sie `newgrp android-sdk` aus
7. `Tools` installieren: `sdkmanager --sdk_root=/opt/android-sdk "tools"`


Jetzt haben Sie alles, was Sie für die Verwaltung der Kommandozeilen-Tools in Ihrer Umgebung brauchen.

### Spezifische Anweisungen

Im Folgenden die Kommandozeilen, die den im obigen Kapitel beschriebenen Schritten entsprechen.

#### Ubuntu


```
$ cd ~
$ wget https://dl.google.com/android/repository/commandlinetools-linux-6609375\_latest.zip
$ sudo mkdir -p /opt/android-sdk
$ sudo unzip ~/commandlinetools-linux-6609375\_latest.zip -d /opt/android-sdk
$ groupadd android-sdk
$ gpasswd -a $USER android-sdk
$ setfacl -R -m g:android-sdk:rwx /opt/android-sdk
$ setfacl -d -m g:android-sdk:rwX /opt/android-sdk
$ chown :android-sdk /opt/android-sdk -R
$ chmod u+w /opt/android-sdk
$ newgrp android-sdk
$ sdkmanager --sdk\_root=/opt/android-sdk "tools"
```


#### Arch Linux

vgl. [https://wiki.archlinux.org/index.php/Android#SDK_packages](https://wiki.archlinux.org/index.php/Android#SDK_packages) und [https://wiki.archlinux.org/index.php/Android#Making_/opt/android-sdk_group-writeable](https://wiki.archlinux.org/index.php/Android#Making_/opt/android-sdk_group-writeable)


```
$ yay -S android-sdk
$ groupadd android-sdk
$ gpasswd -a $USER android-sdk
$ setfacl -R -m g:android-sdk:rwx /opt/android-sdk
$ setfacl -d -m g:android-sdk:rwX /opt/android-sdk
$ chown :android-sdk /opt/android-sdk -R
$ chmod u+w /opt/android-sdk
$ newgrp android-sdk
$ sdkmanager --sdk\_root=/opt/android-sdk "tools"
```


## Android Virtual Device

### Verwalten von SDKs und Tools

Einige nützliche [sdkmanager](https://developer.android.com/studio/command-line/sdkmanager)-Befehle:


```
$ sdkmanager --list
$ sdkmanager --update
```


Bevor Sie fortfahren, vergewissern Sie sich, dass alle Voraussetzungen erfüllt sind:

- überprüfen Sie den PATH für den Zugriff auf die Befehle


```
$ echo $PATH
…:/opt/android-sdk/emulator:/opt/android-sdk/platform-tools:/opt/android-sdk/tools/bin:/opt/android-sdk/emulator
```


- ANDROID_SDK_ROOT überprüfen


```
$ echo $ANDROID\_SDK\_ROOT
/opt/android-sdk
```


- Prüfen Sie die Rechte im Installationsordner


```
$ ll -g $ANDROID\_SDK\_ROOT
Permissions Size User      Group Date Modified Name
drwxrwxr-x@    - user android-sdk 14 Sep 13:13  emulator
drwxrwxr-x@    - user android-sdk 14 Sep 13:19  licenses
drwxrwxr-x@    - user android-sdk 14 Sep 13:11  patcher
drwxrwxr-x@    - user android-sdk 14 Sep 13:13  platform-tools
drwxrwxr-x@    - user android-sdk 14 Sep 13:19  system-images
drwxrwxr-x@    - user android-sdk 14 Sep 13:15  tools
```


- Prüfen Sie, was installiert ist


```
$ sdkmanager --list
Installed packages:=====================] 100% Computing updates...
  Path           | Version | Description                | Location
  -------        | ------- | -------                    | -------
  emulator       | 30.0.26 | Android Emulator           | emulator/
  patcher;v4     | 1       | SDK Patch Applier v4       | patcher/v4/
  platform-tools | 30.0.4  | Android SDK Platform-Tools | platform-tools/
```


### AVDs verwalten

Bevor Sie ein AVD (*Android Virtual Device*) erstellen, müssen Sie ein System-Image auf Ihrer Umgebung installieren.

Erstellen Sie anschließen ein AVD entsprechend eines Hardware-Profils.

Ist dies nicht der Fall, installieren Sie die erforderlichen Elemente:


```
$ sdkmanager "platform-tools" "emulator" "platforms;android-30" "system-images;android-30;google\_apis;x86\_64"

```


Schließlich können Sie ein AVD entsprechend dem gewünschten Bild erstellen:


```
$ avdmanager create avd -n avd-android30-pixel -k "system-images;android-30;google\_apis;x86\_64" --device "pixel"
```


[Starten Sie Ihr AVD dann ab der folgenden Kommandozeile](https://developer.android.com/studio/run/emulator-commandline):


```
$ emulator -avd avd-android30-pixel
```


### Tipps

#### Physische Tastatur

Um die physische Tastatur Ihres Computers im Emulator zu verwenden, ändern Sie den Wert der Variablen `hw.keyboard` in der Datei `~/.android/avd/avd-android30-pixel.avd/config.ini`
**config.ini**

```
hw.keyboard = yes
```


#### Handhabung des Emulators

Es können Befehle an den Emulator gesendet werden, um bestimmte Aktivitäten zu simulieren: Empfang einer SMS, Änderung der GPS-Position, Leistung des GSM, usw.

Die Liste der möglichen Aktionen finden Sie hier: https: [//developer.android.com/studio/run/emulator-console](https://developer.android.com/studio/run/emulator-console)


```
telnet localhost 5554

Trying ::1...
Connected to localhost.
Escape character is '^]'.
Android Console: Authentication required
Android Console: type 'auth <auth\_token>' to authenticate
Android Console: you can find your <auth\_token> in
'/home/user/.emulator\_console\_auth\_token'
OK
auth FEHdxl/bQ4B24S2l
Android Console: type 'help' for a list of commands
OK
sms send 4085555555 hi there
OK
```


#### Öffnen einer Root-Shell

Erstellen Sie eine *Root-Shell*-Konsole auf dem aktuellen Terminal. Sie unterscheidet sich vom *Shell-Befehl adb* in den folgenden Punkten:

- Sie erstellt eine Root-Shell, die es ermöglicht, viele Teile des Systems zu ändern.
- Sie funktioniert auch, wenn der adb-Daemon im emulierten System defekt ist.
- Durch Drücken von Strg+C (⌘C) wird der Emulator statt der Shell angehalten.


siehe https://developer. [android.com/studio/run/emulator-commandline#advanced](https://developer.android.com/studio/run/emulator-commandline#advanced)

## Screenshots

![](../attachments/62559016/62559017.png)![](../attachments/62559016/62559018.png)![](../attachments/62559016/62559020.png)![](../attachments/62559016/62559019.png)

## Bekannte Probleme

### Fehler sdkmanager "Could not create settings"

Ungeachtet des `sdkmanager'-Befehls erhalten wir diese Antwort:


```
$ sdkmanager --list
Warning: Could not create settings
java.lang.IllegalArgumentException
	at com.android.sdklib.tool.sdkmanager.SdkManagerCliSettings.&lt;init>(SdkManagerCliSettings.java:428)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCliSettings.createSettings(SdkManagerCliSettings.java:152)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCliSettings.createSettings(SdkManagerCliSettings.java:134)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:57)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:48)
```


:::info

Lösung

Die Java-Anwendung braucht Hilfe, um das Root Sdk zu finden:


```
$ sdkmanager --sdk\_root=/opt/android-sdk --list
```


:::

### Fehler "Warning: Failed to read or create install properties file."

Es kann nicht in das Verzeichnis `/opt/android-sdk` geschrieben werden.


:::info

Lösung


```
$ sudo chmod g+w /opt/android-sdk
```


:::

### Fehler Emulator "PANIC: Broken AVD system path. Überprüfen Sie Ihren ANDROID_SDK_ROOT-Wert [/opt/android-sdk]!"

Siehe [ https://stackoverflow.com/questions/39645178/panic-broken-avd-system-path-check-your-android-sdk-root-value](https://stackoverflow.com/questions/39645178/panic-broken-avd-system-path-check-your-android-sdk-root-value)

### Emulator-Fehler

Es gibt zwei Binaries in der Installation `/opt/android-sdk/tools/emulator` und `/opt/android-sdk/emulator`. Das ist ein wenig undurchsichtig.

Weniger Probleme traten mit der in `/opt/android-sdk/emulator` installierten Version auf (siehe `sdkmanager --list`). Abhängig von der Variable `$PATH` wird jedoch das andere Binary verwendet (siehe `which emulator`)

## Referenzen

[https://medium.com/michael-wallace/how-to-install-android-sdk-and-setup-avd-emulator-without-android-studio-aeb55c014264](https://medium.com/michael-wallace/how-to-install-android-sdk-and-setup-avd-emulator-without-android-studio-aeb55c014264)


