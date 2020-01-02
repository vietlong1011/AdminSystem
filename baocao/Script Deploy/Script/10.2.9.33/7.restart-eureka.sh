if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
fi

DATE1=`date +%Y%m%d`;
CHECKOUT_DIR=$DATE1

PROCESS1="platform-eureka-server-0.0.1-SNAPSHOT.jar"

echo -e "\033[1;36m STOP eureka------------------------------------------------------------------------------- \e\n[0m"
EUREKA=$(pgrep -f $PROCESS1);
kill -9 $EUREKA;
sleep 1

echo -e "\033[1;36m START eureka------------------------------------------------------------------------- \e\n[0m"

cd /opt/release/eureka
nohup java -jar  platform-eureka-server-0.0.1-SNAPSHOT.jar &

sleep 2

EUREKA=$(pgrep -f $PROCESS1);
echo -e "\033[1;36m FINISH EUREKA $EUREKA ------------------------------------------------ \e\n[0m"

exit


