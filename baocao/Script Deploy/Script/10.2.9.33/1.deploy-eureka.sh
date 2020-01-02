#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS="platform-eureka-server-0.0.1-SNAPSHOT.jar"
DATE=`date +%Y%m%d_%H%M`;
PATH1="/opt/release/eureka"
BACKUP_DIR="/opt/backup/eureka/$DATE/"
mkdir $BACKUP_DIR -p;
echo -e "\033[1;36m BACKUP FOLDER $BACKUP_DIR------------------------------------------------------------------------ \e\n[0m"
#sleep 5;

echo -e "\033[1;36m STOP tmss EUREKA_SERVER------------------------------------------------------------------------------- \e\n[0m"
EUREKA_SERVER=$(pgrep -f $PROCESS);
kill -9 $EUREKA_SERVER;
# echo -e "\033[1;36m KILL PROCESS EUREKA_SERVER DEMO $EUREKA_SERVER ----------------------------------------------- \e\n[0m"

echo -e "\033[1;36m BACKUP tmss EUREKA_SERVER------------------------------------------------------------------------------ \e\n[0m"
cp -rp $PATH1 $BACKUP_DIR;
cp -rp /opt/newsource/eureka/$CHECKOUT_DIR/* /opt/release/eureka
#cp -rp $BACKUP_DIR/config /opt/release/eureka


sleep 5;
echo -e "\033[1;36m RUN NEW SOURCE tmss EUREKA_SERVER------------------------------------------------------------------------- \e\n[0m"
exec >> /opt/release/eureka/nohup.out
exec 2>&1
cd /opt/release/eureka/
nohup java -jar platform-eureka-server-0.0.1-SNAPSHOT.jar &


NEW_EUREKA_SERVER=$(pgrep -f $PROCESS);
echo -e "\033[1;36m FINISH DEPLOYMENT, NEW PROCESS tmss EUREKA_SERVER $NEW_EUREKA_SERVER ------------------------------------------------ \e\n[0m"
exit
