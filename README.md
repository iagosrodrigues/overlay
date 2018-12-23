# My local overlay

You can you it just creating `/etc/portage/repos.conf/noam.conf` with the following content:

```
[noam]
location = /usr/local/noam-overlay
sync-type = git
sync-uri = https://github.com/noamcore/overlay.git
auto-sync = yes
```

After that, you can sync by using `emerge --sync`
