#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

read -sp 'nhap pass user tmss: ' TMV_PASS

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1
DATE=`date +%Y%m%d_%H%M`;

#Upload source
echo "Upload to tmss_sale 01 10.2.9.34 -------------------------------------------------------------------"
sshpass -p "$TMV_PASS" ssh tmss@10.2.9.34 mkdir -p /opt/newsource/sale/$DATE1
sshpass -p "$TMV_PASS" ssh tmss@10.2.9.34 rm -f /opt/newsource/sale/$DATE1/*

sshpass -p "$TMV_PASS" scp -rp /opt/newsource/sale/$DATE1/*.jar tmss@10.2.9.34:/opt/newsource/sale/$DATE1/
sshpass -p "$TMV_PASS" ssh tmss@10.2.9.34 "chown -R tmss:tmss /opt/newsource/sale/$DATE1"


#echo "Upload to tmss_sale 02 192.168.1.204 -------------------------------------------------------------------"
#sshpass -p "$TMV_PASS" ssh 192.168.1.204 mkdir -p /opt/release/tmss_api/$DATE1
#sshpass -p "$TMV_PASS" ssh 192.168.1.204 rm -f /opt/release/tmss_api/$DATE1/*

#sshpass -p "$TMV_PASS" scp -rp /opt/new_source/tmss_api/$DATE1/*.jar 192.168.1.204:/opt/release/tmss_api/$DATE1/
#sshpass -p "$TMV_PASS" ssh 192.168.1.204 "chown -R tmv.tmv /opt/release/tmss-api/$DATE1"

echo "BEGIN DEPLOY tmss_sale 01 10.2.9.34 -------------------------------------------------------------------"
sshpass -p "$TMV_PASS" ssh tmss@10.2.9.34 sh /opt/deploy/1.deploy_tmss_sale.sh &
sleep 2
echo "DEPLOY tmss_sale: DONE"

#echo "BEGIN DEPLOY tmss_api 02 192.168.1.204-------------------------------------------------------------------"
#sshpass -p "$TMV_PASS" ssh 192.168.1.204 /opt/release/deploy_tmss_api.sh &
