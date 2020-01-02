#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS1="tmss-api-0.0.1-SNAPSHOT.jar"
#PROCESS2="tmss-services-api-0.0.1-SNAPSHOT.jar"

echo -e "\033[1;36m STOP tmss api-sale------------------------------------------------------------------------------- \e\n[0m"
SALE=$(pgrep -f $PROCESS1);
kill -9 $SALE;
sleep 1
#echo -e "\033[1;36m STOP tmss api-service------------------------------------------------------------------------------- \e\n[0m"
#SERVICE=$(pgrep -f $PROCESS2);
#kill -9 $SERVICE;
#sleep 1

echo -e "\033[1;36m START tmss api-sale------------------------------------------------------------------------- \e\n[0m"
#exec >> /opt/release/sale/nohup.out
#exec 2>&1
cd /opt/release/sale/
#nohup java -jar platform-eureka-server-0.0.1-SNAPSHOT.jar &
#nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dthin.root=/opt/tmss/ -Dthin.location=./config -jar tmss-api-0.0.1-SNAPSHOT.jar  --spring.profiles.active=gitlabci &
nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dthin.root=/opt/tmss/lib/ -Dthin.offline=true -Dthin.location=file:./config -jar tmss-api-0.0.1-SNAPSHOT.jar --spring.profiles.active=gitlabci &
#nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dloader.path="lib/" -jar -Dspring.config.location=/opt/release/sale/application-gitlabci.properties,classpath:/application.properties tmss-api-0.0.1-SNAPSHOT.jar &
sleep 2
#echo -e "\033[1;36m START tmss api-service------------------------------------------------------------------------- \e\n[0m"
#exec >> /opt/release/service/nohup.out
#exec 2>&1
#cd /opt/release/service/
#nohup java -jar platform-eureka-server-0.0.1-SNAPSHOT.jar &
#nohup java -Duser.timezone=Asia/Ho_Chi_Minh -jar -Dspring.config.location=/opt/release/sale/application-gitlabci.properties,classpath:/application.properties tmss-services-api-0.0.1-SNAPSHOT.jar &

SALE=$(pgrep -f $PROCESS1);
echo -e "\033[1;36m FINISH DEPLOYMENT, NEW PROCESS tmss api-sale $SALE ------------------------------------------------ \e\n[0m"
#SERVICE=$(pgrep -f $PROCESS2);
#echo -e "\033[1;36m FINISH DEPLOYMENT, NEW PROCESS tmss api-sale $SERVICE ------------------------------------------------ \e\n[0m"
exit

