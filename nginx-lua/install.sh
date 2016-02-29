#!/bin/bash

# Add redis-multiinstance files
PWD=`pwd`
cp $PWD/log_by_lua /etc/nginx/
cp $PWD/nginx-stat-lua /etc/cron.d/
cp $PWD/nginx-stat-lua.conf /etc/nginx/conf.d/
less $PWD/manual
nano /etc/nginx/nginx.conf
service nginx reload
