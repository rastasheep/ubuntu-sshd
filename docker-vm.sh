#!/bin/bash -e

# template run.sh:
# `dirname $0`/docker-vm.sh myUserSSHD 5000 `dirname $0`/authorized_keys -v user-data:/data

DNAME=SSHD
DPORT=127.0.0.1:5000
DKEY=~/.ssh/authorized_keys

USAGE="$0 <container name = $DNAME> <public SSH port = $DPORT> <authorized_keys $DKEY> [any further docker run parameters]"

if [ $# -lt 3 ] ; then
	echo $USAGE >&2
fi

NAME=$1
if [ -z "$NAME" ] ; then
	NAME=$DNAME
fi

PORT=$2
if [ -z "$PORT" ] ; then
	PORT=$DPORT
fi

KEY=$3
if [ -z "$KEY" ] ; then
	KEY=$DKEY
fi

(set -x; docker run -d -p $PORT:22 --restart always --name $NAME ${@:4} rastasheep/ubuntu-sshd:18.04)

# recreate ssh server keys
docker exec $NAME rm -v /etc/ssh/ssh_host_*
docker exec -it $NAME dpkg-reconfigure openssh-server
docker restart $NAME

# enforce login using public key
docker exec $NAME passwd -d root
docker cp $KEY $NAME:/root/.ssh/authorized_keys
docker exec $NAME chown root:root /root/.ssh/authorized_keys
