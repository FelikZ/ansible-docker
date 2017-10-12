#!/bin/bash

if ! ls -l ~/.ssh/id_rsa; then
    echo 'You need id_rsa key'
    exit 1
fi

if ! ls -l ~/.ssh/id_rsa.pub; then
    echo 'You need id_rsa.pub key'
    exit 1
fi

ssh-agent -k
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

echo 'run vagrant and ansible stuff...'
cat ~/.ssh/id_rsa.pub > ssh-key.pub
vagrant up --provision
ssh-keygen -f "/home/test/.ssh/known_hosts" -R 192.168.10.2
ssh vagrant@192.168.10.2 exit
ansible-playbook -i vagrant -b -u vagrant cluster.yml