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
