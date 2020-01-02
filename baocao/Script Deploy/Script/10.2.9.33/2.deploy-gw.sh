#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmv user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS="tmss-gateway-0.0.1-SNAPSHOT.jar"
DATE=`date +%Y%m%d_%H%M`;
PATH1="/opt/release/gw"

echo -e "\033[1;36m $DATE------------------------------------------------------------------------ \e\n[0m"
BACKUP_DIR="/opt/backup/gw/$DATE/"
mkdir $BACKUP_DIR -p;
#sleep 5;

echo -e "\033[1;36m STOP tmss-gateway------------------------------------------------------- \e\n[0m"
TMSS_API=$(pgrep -f $PROCESS);
kill -9 $TMSS_API;
echo -e "\033[1;36m KILL PROCESS tmss-gateway $TMSS_API ----------------------------------------------- \e\n[0m"

echo -e "\033[1;36m BACKUP tmss-gateway----------------------------------------------------- \e\n[0m"
cp -rp $PATH1 $BACKUP_DIR;
cp -rp /opt/newsource/gw/$CHECKOUT_DIR/* /opt/release/gw
#cp -rp $BACKUP_DIR/gw/application-gitlabci.properties /opt/release/gw

sleep 5;
echo -e "\033[1;36m RUN NEW SOURCE tmss-gateway---------------------------------------------- \e\n[0m"
exec >> /opt/release/gw/nohup.out
exec 2>&1
cd /opt/release/gw/
#nohup java -jar tmss-gateway-0.0.1-SNAPSHOT.jar &
nohup java  -Duser.timezone=Asia/Ho_Chi_Minh -Dthin.location=./config -jar tmss-gateway-0.0.1-SNAPSHOT.jar --spring.profiles.active=gitlabci
#nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dloader.path="lib/" -jar -Dspring.config.location=/opt/release/gw/application-gitlabci.properties,classpath:/application.properties tmss-gateway-0.0.1-SNAPSHOT.jar &

TMSS_API=$(pgrep -f $PROCESS);
echo -e "\033[1;36m FINISH DEPLOYMENT, NEW PROCESS tmss-gateway $TMSS_API -------------------------- \e\n[0m"
exit
