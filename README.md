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
[N] app-admin/jailkit [2] (~2.17): Allows you to easily put programs and users in a chrooted environment
[N] app-backup/AutoMySQLBackup [2] (~3.0_rc7): Create Daily, Weekly and Monthly backups of MySQL databases.
[N] app-backup/storebackup [2] (~3.5): free, super efficient backup software
[I] app-emulation/wineasio (0.9.2[?]@07.09.2015): ASIO driver for WINE
[N] app-laptop/tpfan-admin [2] (~9999): configuration and monitoring interface for app-laptop/tpfand
[N] app-laptop/tpfand [2] (~9999): fan control software for IBM/Lenovo ThinkPads
[N] app-laptop/tpfand-profiles [2] (~9999): profiles for app-laptop/tpfand
[I] app-office/qownnotes [2] (0.57@26.11.2015): OwnNotes is a plain-text notepad, that (optionally) works together with the notes application of ownCloud.
[I] dev-dotnet/taglib-sharp (2.1.0.0[?]@27.02.2015): Taglib# 2.0 - Managed tag reader/writer
[N] dev-php/pecl-mailparse ((~)2.1.6-r3[2]): A PHP extension for parsing and working with RFC822 and RFC2045 (MIME) compliant messages
[N] dev-python/phply ((~)0.9.1-r1[5]): Parser for PHP written using PLY
[N] dev-python/pyexiv2 [2] (0.3.2-r1): A Python binding to exiv2 for manipulation of EXIF and IPTC image metadata
[N] dev-python/python-dmidecode [2] (~3.12.2): Python extension module for dmidecode
[N] dev-python/tblib [2] ((~)1.0.1): Traceback fiddling library. Allows you to pickle tracebacks.
[I] games-util/urtconnector [2] (0.9.0[?]@30.07.2015): Advanced UrbanTerror launcher program
[I] gnome-extra/nemo-audio-tab [2] (2.8.0@13.11.2015): View audio tag information from the file manager's properties tab
[I] gnome-extra/nemo-emblems [2] (2.8.0@13.11.2015): Change your folder and file emblems
[I] gnome-extra/nemo-fileroller [2] (2.8.0@13.11.2015): File Roller integration for Nemo
[I] gnome-extra/nemo-gtkhash [2] (2.8.0@14.11.2015): nemo extension for computing checksums and more using gtkhash
[I] gnome-extra/nemo-image-converter [2] (2.8.0@14.11.2015): nemo extension to mass resize or rotate images
[N] gnome-extra/nemo-preview [2] ((~)2.8.0): nemo-preview is a quick previewer for nemo
[I] gnome-extra/nemo-python [2] (2.8.0@13.11.2015): Python binding for Nemo components
[I] gnome-extra/nemo-repairer [2] (2.8.0@14.11.2015): Nemo extension for filename encoding repair
[I] gnome-extra/nemo-seahorse [2] (2.8.0@14.11.2015): seahorse plugins and utilities for encryption
[I] gnome-extra/nemo-share [2] (2.8.0@14.11.2015): Nemo extension to share folder using Samba
[I] gnome-extra/nemo-terminal [2] (2.8.0@14.11.2015): Nemo extension to enable an embedded terminal
[I] media-libs/asio-sdk (2.3[?]@04.02.2015): Steinberg ASIO SDK 2.3 - win32
[I] media-sound/banshee (2.6.2[?]@04.02.2015): Import, organize, play, and share your music using a simple and powerful interface
[I] media-sound/hydrogen (0.9.6_rc2[?]@03.02.2015): Advanced drum machine
[I] media-sound/jack-audio-connection-kit (1.9.10[4]@26.09.2015): Jackdmp jack implemention for multi-processor machine
[N] media-sound/ladish ((~)1-r2[4]): LADI Session Handler - a session management system for JACK applications
[N] media-sound/decibel-audio-player [2] (1.08): A GTK+ audio player which aims at being very straightforward to use
[I] net-im/skype4pidgin [2] (9999[?]@13.11.2015): Skype API PLugin for Pidgin
[I] net-print/brother-dcp9020cdw-bin [2] (1.1.2-r1[?]@23.09.2015): Brother printer driver for DCP-9020CDW & DCP-9022CDW
[I] sci-visualization/circos (0.66[?]@04.02.2015): Circular layout visualization of genomic and other data
[N] sys-apps/gentoo-systemd-units [2] (~0.3): some usefull units for systemd on gentoo based systems
[N] sys-kernel/rt-sources ((~)4.1.13_p15(4.1.13_p15)[2]): Full Linux 4.1 kernel sources with the CONFIG_PREEMPT_RT patch
[N] sys-power/phc-intel (~0.3.2.12.19[2]): Processor Hardware Control for Intel CPUs
[N] sys-process/rtirq ((~)20150216[2]): Change the realtime scheduling policy and priority of relevant system driver IRQ handlers
[N] www-servers/selenium-server-standalone [2] (~2.45.0): Selenium Serer Standalone
[I] x11-plugins/purple-facebook (9999[2]@18.11.2015): Facebook protocol plugin for libpurple
[I] x11-themes/elegance-colors [2] (9999[?]@04.02.2015): a highly customizable chameleon theme for Gnome Shell
```
