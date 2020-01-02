#!/bin/bash
if [ `whoami` != "tmss" ];
then
    echo "You must run this script by tmss user!!"
    exit 0
else

DATE=`date +%Y%m%d_%H%M`
DATE_2=`date +%Y%m%d`
echo -e "\033[1;36m Backing up source code................................................................................................. \e[0m"

if [ -d "/opt/backup/front/sale/$DATE_2" ]; then
    sudo mv /opt/backup/front/sale/$DATE_2 /opt/backup/front/sale/$DATE
    sudo mkdir -p /opt/backup/front/sale/$DATE_2
else
    sudo mkdir -p /opt/backup/front/sale/$DATE_2
fi
sudo mv /var/www/sale/* /opt/backup/front/sale/$DATE_2/
echo -e "\033[1;36m Unzip and copy new source code......................................................................................... \e[0m"
sleep 2

sudo unzip /opt/newsource/front/sale/$DATE_2/*.zip -d /var/www/sale > /dev/null
sudo rm -rf /var/www/sale/assets/env.json
sudo cp /opt/backup/front/sale/$DATE_2/assets/env.json /var/www/sale/assets/
sleep 2

echo -e "\033[1;36m Changing owner of /var/www/sale ....................................................................................... \e[0m"
sudo chown nginx:nginx /var/www/ -R
sudo chown tmss:tmss /opt/backup/ -R
fi

