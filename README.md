# yumrepo-git-update

My personal YUM repository for providing git RPMs.

## Supported Platforms

### el6-x86_64

#### Installation

```
$ sudo sh -c 'echo "[kohkimakimoto-git-update-el6-x86_64]
name=kohkimakimoto-git-update-el6-x86_64
baseurl=https://kohkimakimoto.github.io/yumrepo-git-update/el6-x86_64
gpgcheck=0
enabled=0
" > /etc/yum.repos.d/kohkimakimoto-git-update-el6-x86_64.repo'
```

#### Usage

```
$ sudo yum install --enablerepo=kohkimakimoto-git-update-el6-x86_64 git
```

or 

```
$ sudo yum update --enablerepo=kohkimakimoto-git-update-el6-x86_64 git
```

### el7-x86_64

#### Installation

```
$ sudo sh -c 'echo "[kohkimakimoto-git-update-el7-x86_64]
name=kohkimakimoto-git-update-el7-x86_64
baseurl=https://kohkimakimoto.github.io/yumrepo-git-update/el7-x86_64
gpgcheck=0
enabled=0
" > /etc/yum.repos.d/kohkimakimoto-git-update-el7-x86_64.repo'
```

#### Usage

```
$ sudo yum install --enablerepo=kohkimakimoto-git-update-el7-x86_64 git
```

or 

```
$ sudo yum update --enablerepo=kohkimakimoto-git-update-el7-x86_64 git
```

## Maintainer

Kohki Makimoto <kohki.makimoto@gmail.com>
