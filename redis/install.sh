#!/bin/bash

# Add redis-multiinstance files
PWD=`pwd`
cp $PWD/redis* /opt/zabbix/
cp $PWD/userparameter* /etc/zabbix/zabbix_agentd.d/
service zabbix-agent restart
