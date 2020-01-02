#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
else

DATE=`date +%Y%m%d_%H%M`
DATE_2=`date +%Y%m%d`
echo -e "\033[1;36m Backing up source code................................................................................................. \e[0m"

if [ -d "/opt/backup/front/service/$DATE_2" ]; then
    sudo mv /opt/backup/front/service/$DATE_2 /opt/backup/front/service/$DATE
    sudo mkdir -p /opt/backup/front/service/$DATE_2
else
    sudo mkdir -p /opt/backup/front/service/$DATE_2
fi

sudo mv /var/www/services/* /opt/backup/front/service/$DATE_2/
echo -e "\033[1;36m Unzip and copy new source code......................................................................................... \e[0m"
sleep 2

sudo unzip /opt/newsource/front/service/$DATE_2/*.zip -d /var/www/services > /dev/null
sudo rm -rf /var/www/services/assets/env.json
sudo cp /opt/backup/front/service/$DATE_2/assets/env.json /var/www/services/assets/
sleep 2

echo -e "\033[1;36m Changing owner of /var/www/service .................................................................................... \e[0m"
sudo chown nginx:nginx /var/www/ -R
sudo chown tmss:tmss /opt/backup/ -R
fi

