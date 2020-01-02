if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS1="tmss-gateway-0.0.1-SNAPSHOT.jar"

echo -e "\033[1;36m STOP Gw------------------------------------------------------------------------------- \e\n[0m"
GW=$(pgrep -f $PROCESS1);
kill -9 $GW;
sleep 1

echo -e "\033[1;36m START Gw------------------------------------------------------------------------- \e\n[0m"

cd /opt/release/gw

#nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dloader.path="lib/" -jar -Dspring.config.location=/opt/release/gw/application-gitlabci.properties,classpath:/application.properties tmss-gateway-0.0.1-SNAPSHOT.jar &
nohup java -Duser.timezone=Asia/Ho_Chi_Minh -Dthin.root=/opt/tmss_gw/ -Dthin.location=./config -jar tmss-gateway-0.0.1-SNAPSHOT.jar  --spring.profiles.active=gitlabci &
sleep 2

GW=$(pgrep -f $PROCESS1);
echo -e "\033[1;36m FINISH Gw  $GW ------------------------------------------------ \e\n[0m"

exit
