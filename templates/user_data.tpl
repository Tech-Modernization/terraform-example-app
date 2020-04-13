#!/bin/bash

echo "${message}" > index.html
nohup busybox httpd -f -p ${app_port} &