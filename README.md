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

### some usefull stuff for server

```
app-admin/jailkit: Allows you to easily put programs and users in a chrooted environment
app-backup/AutoMySQLBackup: Create Daily, Weekly and Monthly backups of MySQL databases.
dev-php/awl: Andrew McMillan's Web Libraries
mail-filter/dovecot-antispam: A dovecot antispam plugin supporting multiple backends
net-im/prosody-modules: unofficial modules for prosody
net-mail/z-push: Z-Push syncs ActiveSync compatible devices against various backends
net-misc/clusterssh: Concurrent Multi-Server Terminal Access
sys-apps/systemd-amavisd-milter: Amavisd-milter systemd service
sys-apps/systemd-custom-timer: some custom timer units for systemd on gentoo based systems
sys-apps/systemd-opendmarc: opendmarc systemd service
sys-apps/systemd-pure-ftpd: pure-ftpd systemd service
www-apache/mod_qos: A QOS module for the apache webserver
www-servers/selenium-server-standalone: Selenium Serer Standalone
```

### music stuff

```
app-emulation/wineasio: ASIO driver for WINE
media-libs/asio-sdk: Steinberg ASIO SDK 2.3 - win32
media-sound/jack2: Jackdmp jack implemention for multi-processor machine
media-sound/scdl: Soundcloud Music Downloader
media-sound/hdjd: Hercules DJ Control MP3e2 translation daemon
```

### misc

```
dev-tex/rechnung: LaTeX module to create invoices
games-util/urtconnector: Advanced UrbanTerror launcher program
sci-visualization/circos: Circular layout visualization of genomic and other data
media-video/filebot: Java-based tools to rename TV shows, download subtitles, and validate checksums
net-p2p/monero: a cryptocurrency with a focus on private and censorship-resistant transactions
net-p2p/monero-core: This is the GUI for the core Monero implementation
```
