#!/bin/bash
datecheck=$(date +"%Y%m%d%H%M")
datefolder=$(date +"%d-%m-%Y")
jmeter -n -t /opt/jmeter_script/iima_live16Jan2014_50users_5rampup.jmx -p /opt/jmeter_script/user.properties -l /tmp/iima_live16Jan2014_50users_5rampup$datecheck.jtl -j /var/www/html/iima_live16Jan2014_50users_5rampup$datecheck.log
cd /tmp
tar czf iima_live16Jan2014_50users_5rampup$datecheck.jtl.tgz iima_live16Jan2014_50users_5rampup$datecheck.jtl
s3cmd put iima_live16Jan2014_50users_5rampup$datecheck.jtl.tgz s3://testup006/vib_performance/iima/$datefolder/
