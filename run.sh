#!/bin/sh

ansible-playbook -i hosts --ask-sudo-pass first.yml
. ~/.bashrc
ansible-playbook -i hosts --ask-sudo-pass second.yml

