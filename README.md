# hering-overlay

## usage

create file `/etc/portage/repos.conf/hering-overlay.conf`:

```
[hering-overlay]
location = /usr/local/portage/hering-overlay
sync-type = git
sync-uri = git://github.com/internethering/hering-overlay.git
```

after an `emerge --sync` you can use my overlay

## hints

You find in my overlay ebuilds for the [nemo-extensions](https://github.com/linuxmint/nemo-extensions).

## avaiable ebuilds

```
app-admin/jailkit: Allows you to easily put programs and users in a chrooted environment
app-backup/AutoMySQLBackup: Create Daily, Weekly and Monthly backups of MySQL databases.
app-backup/storebackup: free, super efficient backup software
app-emulation/wineasio: ASIO driver for WINE
app-laptop/tpfan-admin: configuration and monitoring interface for app-laptop/tpfand
app-laptop/tpfand: fan control software for IBM/Lenovo ThinkPads
app-laptop/tpfand-profiles: profiles for app-laptop/tpfand
app-office/qownnotes: OwnNotes is a plain-text notepad, that (optionally) works together with the notes application of ownCloud.
dev-dotnet/taglib-sharp: Taglib# 2.0 - Managed tag reader/writer
dev-php/pecl-mailparse: A PHP extension for parsing and working with RFC822 and RFC2045 (MIME) compliant messages
dev-python/letsencrypt: Let's Encrypt client
dev-python/letsencrypt-acme: ACME protocol implementation in Python
dev-python/letsencrypt-apache: Apache plugin for Let's Encrypt client
dev-python/letsencrypt-nginx: Nginx plugin for Let's Encrypt client
dev-python/phply: Parser for PHP written using PLY
dev-python/pyexiv2: A Python binding to exiv2 for manipulation of EXIF and IPTC image metadata
dev-python/python-dmidecode: Python extension module for dmidecode
dev-python/tblib: Traceback fiddling library. Allows you to pickle tracebacks.
dev-python/zope-component: Zope Component Architecture
dev-python/zope-event: Event publishing / dispatch, used by Zope Component Architecture
games-util/urtconnector: Advanced UrbanTerror launcher program
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
media-libs/asio-sdk: Steinberg ASIO SDK 2.3 - win32
media-sound/banshee: Import, organize, play, and share your music using a simple and powerful interface
media-sound/hydrogen: Advanced drum machine
media-sound/jack-audio-connection-kit: Jackdmp jack implemention for multi-processor machine
media-sound/ladish: LADI Session Handler - a session management system for JACK applications
media-sound/decibel-audio-player: A GTK+ audio player which aims at being very straightforward to use
net-im/skype4pidgin: Skype API PLugin for Pidgin
net-print/brother-dcp9020cdw-bin: Brother printer driver for DCP-9020CDW & DCP-9022CDW
sci-visualization/circos: Circular layout visualization of genomic and other data
sys-apps/gentoo-systemd-units: some usefull units for systemd on gentoo based systems
sys-kernel/rt-sources: Full Linux 4.1 kernel sources with the CONFIG_PREEMPT_RT patch
sys-power/phc-intel: Processor Hardware Control for Intel CPUs
sys-process/rtirq: Change the realtime scheduling policy and priority of relevant system driver IRQ handlers
www-servers/selenium-server-standalone: Selenium Serer Standalone
x11-plugins/purple-facebook: Facebook protocol plugin for libpurple
x11-themes/elegance-colors: a highly customizable chameleon theme for Gnome Shell
```
