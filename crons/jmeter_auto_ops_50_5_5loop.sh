#!/bin/bash
datecheck=$(date +"%Y%m%d%H%M")
datefolder=$(date +"%d-%m-%Y")
jmeter -n -t /opt/jmeter_script/ops_demo_22jan2014_50users_5rampup_5loop.jmx -p /opt/jmeter_script/user.properties -l /tmp/ops_demo_22jan2014_50users_5rampup_5loop$datecheck.jtl -j /var/www/html/ops_demo_22jan2014_50users_5rampup_5loop$datecheck.log
cd /tmp
tar czf ops_demo_22jan2014_50users_5rampup_5loop$datecheck.jtl.tgz ops_demo_22jan2014_50users_5rampup_5loop$datecheck.jtl
s3cmd put ops_demo_22jan2014_50users_5rampup_5loop$datecheck.jtl.tgz s3://testup006/vib_performance/newiima/$datefolder/
