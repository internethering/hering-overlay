# hering-overlay

My personal overlay with some ebuilds from different scope of applications. I pay attention on keeping all ebuilds up to date and good harmony to the portage tree. If you have problems, please file an [issue](https://github.com/internethering/hering-overlay/issues) or contact me per e-mail: richard@internethering.de

## usage

### by layman

you can use my overlay with layman: `layman -a hering-overlay`. How to use layman? Read the [user guide](https://wiki.gentoo.org/wiki/Project:Overlays/User_Guide) ;)

### directly

create file `/etc/portage/repos.conf/hering-overlay.conf`:

```
[hering-overlay]
location = /usr/local/portage/hering-overlay
sync-type = git
sync-uri = git://github.com/internethering/hering-overlay.git
```

after an `emerge --sync` you can use my overlay

## avaiable ebuilds

### [nemo-extensions](https://github.com/linuxmint/nemo-extensions)

```
gnome-extra/nemo-audio-tab: View audio tag information from the file manager's properties tab
gnome-extra/nemo-emblems: Change your folder and file emblems
gnome-extra/nemo-fileroller: File Roller integration for Nemo
gnome-extra/nemo-gtkhash: nemo extension for computing checksums and more using gtkhash
gnome-extra/nemo-image-converter: nemo extension to mass resize or rotate images
gnome-extra/nemo-preview: nemo-preview is a quick previewer for nemo
gnome-extra/nemo-python: Python binding for Nemo components
gnome-extra/nemo-repairer: Nemo extension for filename encoding repair
gnome-extra/nemo-seahorse: seahorse plugins and utilities for encryption
gnome-extra/nemo-share: Nemo extension to share folder using Samba
gnome-extra/nemo-terminal: Nemo extension to enable an embedded terminal

```

### some usefull stuff for server

```
app-admin/jailkit: Allows you to easily put programs and users in a chrooted environment
app-backup/AutoMySQLBackup: Create Daily, Weekly and Monthly backups of MySQL databases.
app-backup/storebackup: free, super efficient backup software
dev-php/awl: Andrew McMillan's Web Libraries
mail-filter/dovecot-antispam: A dovecot antispam plugin supporting multiple backends
net-im/prosody-modules: unofficial modules for prosody
net-mail/z-push: Z-Push syncs ActiveSync compatible devices against various backends
net-misc/clusterssh: Concurrent Multi-Server Terminal Access
sys-apps/systemd-amavisd-milter: Amavisd-milter systemd service
sys-apps/systemd-custom-timer: some custom timer units for systemd on gentoo based systems
sys-apps/systemd-opendmarc: opendmarc systemd service
sys-apps/systemd-pure-ftpd: pure-ftpd systemd service
sys-apps/systemd-rmilter: rmilter systemd service
www-apache/mod_qos: A QOS module for the apache webserver
www-apache/mod_security: Web application firewall and Intrusion Detection System for Apache
www-apache/modsecurity-crs: Core Rule Set for ModSecurity
www-servers/selenium-server-standalone: Selenium Serer Standalone
```

### kernel & realtime stuff

```
sys-process/rtirq: Change the realtime scheduling policy and priority of relevant system driver IRQ handlers
sys-power/phc-intel: Processor Hardware Control for Intel CPUs
media-sound/hdj_mod: GPL Linux MIDI drivers for Hercules DJ midi controller devices
```

### music stuff

```
app-emulation/wineasio: ASIO driver for WINE
media-libs/asio-sdk: Steinberg ASIO SDK 2.3 - win32
media-sound/jack-audio-connection-kit: Jackdmp jack implemention for multi-processor machine
media-sound/scdl: Soundcloud Music Downloader
```

### misc

```
games-util/urtconnector: Advanced UrbanTerror launcher program
sci-visualization/circos: Circular layout visualization of genomic and other data
x11-plugins/pidgin-skypeweb: SkypeWeb Plugin for Pidgin
net-p2p/pybitmessage: P2P communications protocol
```
