#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS="tmss-api-0.0.1-SNAPSHOT.jar"
DATE=`date +%Y%m%d_%H%M`;
PATH1="/opt/release/sale"
BACKUP_DIR="/opt/backup/sale/$DATE/"
mkdir $BACKUP_DIR -p;
echo -e "\033[1;36m BACKUP FOLDER $BACKUP_DIR------------------------------------------------------------------------ \e\n[0m"
#sleep 5;

echo -e "\033[1;36m STOP tmss api-sale------------------------------------------------------------------------------- \e\n[0m"
SALE=$(pgrep -f $PROCESS);
kill -9 $SALE;
# echo -e "\033[1;36m KILL PROCESS EUREKA_SERVER DEMO $EUREKA_SERVER ----------------------------------------------- \e\n[0m"

echo -e "\033[1;36m BACKUP tmss api-sale------------------------------------------------------------------------------ \e\n[0m"
cp -rp $PATH1 $BACKUP_DIR;
cp -rp /opt/newsource/sale/$CHECKOUT_DIR/* /opt/release/sale
cp -rp $BACKUP_DIR/sale/application-gitlabci.properties /opt/release/sale


sleep 5;
echo -e "\033[1;36m RUN NEW SOURCE tmss api-sale------------------------------------------------------------------------- \e\n[0m"
exec >> /opt/release/sale/nohup.out
exec 2>&1
cd /opt/release/sale/
#nohup java -jar platform-eureka-server-0.0.1-SNAPSHOT.jar &
nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dloader.path="lib/" -jar -Dspring.config.location=/opt/release/sale/application-gitlabci.properties,classpath:/application.properties tmss-api-0.0.1-SNAPSHOT.jar &

SALE=$(pgrep -f $PROCESS);
echo -e "\033[1;36m FINISH DEPLOYMENT, NEW PROCESS tmss api-sale $SALE ------------------------------------------------ \e\n[0m"
exit
