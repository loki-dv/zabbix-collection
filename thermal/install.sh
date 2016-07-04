#!/bin/bash

cp ./thermal.conf /etc/zabbix/zabbix_agentd.d/thermal.conf
cp ./thermal.sh /opt/zabbix/thermal.sh
chmod +x /opt/zabbix/thermal.sh
service zabbix-agent restart
cat ./thermal.xml
