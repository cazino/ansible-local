#!/bin/sh

ansible-playbook -i hosts --ask-become-pass first.yml
. ~/.bashrc
ansible-playbook -i hosts second.yml
. ~/.bashrc
