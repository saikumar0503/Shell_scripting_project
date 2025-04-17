#!/bin/bash

echo -e "\033[41m===========================Health check of your server===========================\033[0m"
echo -e "\033[41m=================================Merory usage===================================\033[0m"

echo -e "Your Memory usage is : \033[1;32m$(free -m | awk 'NR==2 { print $2 }')MB\033[0m"

echo -e "\033[41m==================================uptime=========================================\033[0m"
echo -e "Your Server Running Time is : \033[1;32m$(uptime | awk 'NR==1 { print $3 }')\033[0m"

echo -e "\033[41m=================================Disk Usage======================================\033[0m"
echo -e "Your Disk usage is : \033[1;34m$(df -h)\033[0m"

echo -e "\033[41m=================================Active Users======================================\033[0m"
echo -e "Your Active Users are : \033[1;34m$(who | awk '{print $1}')\033[0m"


echo -e "\033[41m=================================Fire Wall Status================================\033[0m"
echo -e "Your Fire Wall \033[1;32m$(sudo ufw status)\033[0m"

echo -e "\033[41m=================================Upgrades Done==================================\033[0m"
echo -e "Your upgrades list is : \033[1;34m$(apt list --upgradable)\033[0m"

echo -e "\033[41m=================================Ports Listed==================================\033[0m"
echo -e " Ports Listed in your server is : \033[1;34m$(netstat -tuln)\033[0m"

echo -e "\033[41m=================================Services Status=================================\033[0m"

read -p "Which service do you want to check : " service
echo -e " The service is you choose : $service"
echo -e " Your service status is : \033[1;32m$s(sudo systemctl status $service| awk 'NR==3 {print $2 $3 }')\033[0m"
echo -e "\033[41m================================End of the script===============================\033[0m"
echo -e "\033[41m==============================Thanks For Using===================================\033[0m"

