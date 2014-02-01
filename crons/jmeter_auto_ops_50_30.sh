#!/bin/bash
datecheck=$(date +"%Y%m%d%H%M")
jmeter -n -t /opt/jmeter_script/ops_demo_22jan2014_50users_30rampup.jmx -p /opt/jmeter_script/user.properties -l /tmp/ops_demo_22jan2014_50users_30rampup$datecheck.jtl -j /var/www/html/ops_demo_22jan2014_50users_30rampup$datecheck.log
cd /tmp
mv /opt/jmeter_script/ops_50users_30rampup.csv ./jmeter_script/ops_50users_30rampup$datecheck.csv
tar czf ops_demo_22jan2014_50users_30rampup$datecheck.jtl.tgz ops_demo_22jan2014_50users_30rampup$datecheck.jtl
s3cmd put ops_demo_22jan2014_50users_30rampup$datecheck.jtl.tgz s3://testup006/vib_performance/newiima/
