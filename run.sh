#!/bin/sh -xue

# USAGE : run.sh nameofinventory

INVENTORY=$1

ansible-playbook -i inventories/$INVENTORY --ask-become-pass first.yml
. ~/.bashrc
ansible-playbook -i inventories/$INVENTORY second.yml
. ~/.bashrc
