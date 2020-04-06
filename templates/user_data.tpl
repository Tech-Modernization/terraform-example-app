#!/bin/bash

apt-get update
apt-get install -y ansible
sudo -H -u ubuntu bash -c 'ansible-pull -i localhost, --connection=local --extra-vars "app_port=${app_port}" -U https://github.com/AaronNBrock/message-board.git -C "v0.1.0"  deploy.yml' 
