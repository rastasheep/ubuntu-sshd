# Ubuntu-sshd

Dockerized SSH service, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) images.

## Image tags

- sagudev/ubuntu-sshd:14.04 (trusty)
- sagudev/ubuntu-sshd:16.04 (xenial, latest)
- sagudev/ubuntu-sshd:17.10 (artful)
- sagudev/ubuntu-sshd:18.04 (bionic, dev)



## Installed packages

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

