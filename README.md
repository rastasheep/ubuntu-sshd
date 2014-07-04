# Ubuntu-sshd

Dockerized SSH service, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) images.

## Image tags

- rastasheep/ubuntu-sshd:12.04 (precise)
- rastasheep/ubuntu-sshd:12.10 (quantal)
- rastasheep/ubuntu-sshd:13.04 (raring)
- rastasheep/ubuntu-sshd:13.10 (saucy)
- rastasheep/ubuntu-sshd:14.04 (trusty)

## Installed packages

Base:

- [precise (12.04) minimal](http://packages.ubuntu.com/precise/ubuntu-minimal)
- [quantal (12.10) minimal](http://packages.ubuntu.com/quantal/ubuntu-minimal)
- [raring (13.04) minimal](http://packages.ubuntu.com/raring/ubuntu-minimal)
- [saucy (13.10) minimal](http://packages.ubuntu.com/saucy/ubuntu-minimal)
- [trusty (14.04) minimal](http://packages.ubuntu.com/trusty/ubuntu-minimal)

Image specific:
- [openssh-server](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)

Config:

  - `PermitRootLogin yes`
  - `UsePAM no`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D`
  - root password: `root`

## Run example

```bash
$ sudo docker run -d -P --name test_sshd rastasheep/ubuntu-sshd:14.04
$ sudo docker port test_sshd 22
  0.0.0.0:49154

$ ssh root@localhost -p 49154
# The password is `root`
root@test_sshd $
```

## Issues

If you run into any problems with this image, please check (and potentially file new) issues on the [rastasheep/ubuntu-sshd](https://github.com/rastasheep/ubuntu-sshd/issues) repo, which is the source for this image.

