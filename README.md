# yumrepo-git-update

My personal YUM repository for providing git RPMs.

## Supported Platforms

### el6-x86_64

#### Installation

```
$ sudo sh -c 'echo "[kohkimakimoto-git-update-el6-x86_64]
name=kohkimakimoto-el6-x86_64
baseurl=https://kohkimakimoto.github.io/yumrepo-git-update/el6-x86_64
gpgcheck=0
enabled=0
" > /etc/yum.repos.d/kohkimakimoto-git-update-el6-x86_64.repo'
```

### el7-x86_64

#### Installation

```
$ sudo sh -c 'echo "[kohkimakimoto-git-update-el7-x86_64]
name=kohkimakimoto-el7-x86_64
baseurl=https://kohkimakimoto.github.io/yumrepo-git-update/el7-x86_64
gpgcheck=0
enabled=0
" > /etc/yum.repos.d/kohkimakimoto-git-update-el7-x86_64.repo'
```

## Maintainer

Kohki Makimoto <kohki.makimoto@gmail.com>
