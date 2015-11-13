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

You find in my overlay ebuilds for the [nemo-extensions](https://github.com/linuxmint/nemo-extensions). If you wan't to emerge cinnamon 2.8, have a look at the [open-overlay](https://github.com/pantera31752/open-overlay/).
