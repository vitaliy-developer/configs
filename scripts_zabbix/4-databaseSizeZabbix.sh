#!/bin/bash
# Check size DB Zabbix
sizeDB=$(echo "SELECT pg_size_pretty( pg_database_size( 'zabbix' ) );" | PGPASSWORD=1234qaz psql -h localhost -p 5432 -d zabbix -U zabbix | sed '3!d')

echo $sizeDB | awk '{print $1}'
