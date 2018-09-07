#!/bin/bash         

# Current time
printf "+-------------+\n"
printf "|Current Time |\n"
printf "|-------------|\n" 
printf "|"
date +"%T"'     |'
printf "+-------------+\n"
# Timezone
printf ""
printf "+------------------+\n"
printf "|Current Time Zone |\n"
printf "+------------------+\n"
date +"%:z %Z"
printf "+------------------+\n"
# Uptime
printf "+---------------------------------------------------------------+\n"
printf "|Current Uptime 						|\n"
printf "+---------------------------------------------------------------+\n"
uptime
printf "+---------------------------------------------------------------+\n"
# Operating system
printf "+-----------------+\n"
printf "|Operating system |\n"
printf "+-----------------+\n"
uname -o 
printf "+-----------------+\n"
# KernelVersion
printf "+-----------------+\n"
printf "|Kernal Version	  |\n"
printf "+-----------------+\n"
uname -r
printf "+-----------------+\n"
# CPU Brand and type
printf "+---------------------------------------------------------+\n"
printf "|CPU Brand and type                                       |\n"
printf "+---------------------------------------------------------+\n"
cat /proc/cpuinfo | grep 'vendor' | uniq
cat /proc/cpuinfo | grep 'model name' | uniq
printf "+---------------------------------------------------------+\n"
# Ram amount
printf "+--------------------------+\n"
printf "|Ram amount                |\n"
printf "+--------------------------+\n"
cat /proc/meminfo | grep 'MemTotal'
printf "+--------------------------+\n"
# HDD amount
printf "+-----------------------------------------------------------------------------------+\n"
printf "|HDD amount                                                                         |\n"
printf "+-----------------------------------------------------------------------------------+\n"
df -H
printf "+-----------------------------------------------------------------------------------+\n"
#Get ARP Table
printf "+--------------------------------------------------------+\n"
printf "|ARP Table                                               |\n"
printf "+--------------------------------------------------------+\n"
arp -a
printf "+--------------------------------------------------------+\n"
#getMACs for all interfaces
printf "+------------------------------+\n"
printf "|MACs for all interfaces       |\n"
printf "+------------------------------+\n"
ip -o link  | awk '{print $2,$(NF-2)}' 
printf "+------------------------------+\n"
#Hostname and domain
printf "+-------------------------------------------------+\n"
printf "|Hostname and domain                              |\n"
printf "+-------------------------------------------------+\n"
printf "|Username: "
id -un
printf "|UID: "
id -u
printf "|Primary Group: "
id -gn
printf "|Primary GID: "
id -g
printf "|Group List: "
id -Gn
printf "|GID List: "
id -G
printf "+-------------------------------------------------+\n"
#list of users
printf "+------------------------------------------------------------------------------------+\n"
printf "|List of users                                                                       |\n"
printf "+------------------------------------------------------------------------------------+\n"
cat /etc/passwd
printf "+------------------------------------------------------------------------------------+\n"
printf "+---------------------------------------------------+\n"
printf "|Start at boot                                      |\n"
printf "+---------------------------------------------------+\n"
initctl list
printf "+---------------------------------------------------+\n"

#List of scheduled tasks
printf "+--------------------------+\n"
printf "|List ofschedueled tasks   |\n"
printf "+--------------------------+\n"
printf "|User crontabs             |\n"
sudo ls /var/spool/cron/crontabs/
printf "|System-wide crontabs      |\n"
sudo ls /var/spool/cron/crontabs
printf "+--------------------------+\n"
#Network shares printers, wifi profiles
printf "+---------------------------------------------------------------------+\n"
printf "|Network shares, printers, wifi profiles                              |\n"
printf "+---------------------------------------------------------------------+\n"
printf "Network shares: \n"
sudo smbstatus --shares
printf "Printers: \n"
lpstat -p
printf "WiFi Profiles: \n"
ls /etc/NetworkManager/system-connections
printf "+---------------------------------------------------------------------+\n"
#GetRoutingInfo
printf "+---------------------------------------------------------------------------------+\n"
printf "|Get Routing Info                                                                 |\n"
printf "+---------------------------------------------------------------------------------+\n"
route -n
printf "+---------------------------------------------------------------------------------+\n"
#Get IPV4 for all interfaces
printf "+--------------------------------+\n"
printf "|Get IPV4 for all interfaces     |\n"
printf "+--------------------------------+\n"
ip addr | awk '/^[0-9]+/ { currentinterface=$2 } $1 == "inet" { split( $2, foo, "/" ); print currentinterface ,foo[1] }'
printf "+--------------------------------+\n"
#Get IPV6 for all interfaces
printf "+--------------------------------+\n"
printf "|Get IPV6 for all interfaces     |\n"
printf "+--------------------------------+\n"
ip addr | awk '/^[0-9]+/ { currentinterface=$2 } $1 == "inet6" { split( $2, foo, "/" ); print currentinterface ,foo[1] }'
printf "+--------------------------------+\n"
#show Listening Services
printf "+------------------------------------------------------------------------------------------------+\n"
printf "|Show Listening Services                                                                         |\n"
printf "+------------------------------------------------------------------------------------------------+\n"
sudo netstat -plnt
printf "+------------------------------------------------------------------------------------------------+\n"
#established connections
printf "+------------------------+\n"
printf "|Established Connections |\n"
printf "+------------------------+\n"
netstat -anp | grep 'ESTABLISHED'
printf "+------------------------------------------------------------------------------------------------+\n"
#List All Programs
printf "+-----------------+\n"
printf "|List All Programs|\n"
printf "+-----------------+\n"
ls /usr/share/applications | awk -F '.desktop' ' { print $1}' -
printf "+------------------------------------------------------------------------------------------------+\n"
#Process List
printf "+------------+\n"
printf "|Process List|\n"
printf "+------------+\n"
ps -aux
printf "+------------------------------------------------------------------------------------------------+\n"
#Driver List
printf "+-------------+\n"
printf "|Drivers List |\n"
printf "+-------------+\n"
cat /proc/modules
printf "+------------------------------------------------------------------------------------------------+\n"
#Files in Downloads and Documents
printf "+------------------+\n"
printf "|Files in Downloads|\n"
printf "+------------------+\n"
ls /home/*/Downloads
printf "+------------------+\n"
printf "|Files in Documents|\n"
printf "+------------------+\n"
ls /home/*/Documents
printf "+------------------+\n"
printf "|Files on Desktop  |\n"
printf "+------------------+\n"
ls /home/*/Desktop
printf "+------------------+\n"
printf "|Files in Trash    |\n"
printf "+------------------+\n"
ls /home/*/.local/share/Trash
printf "+------------------------+\n"
printf "|Recently modified files |\n"
printf "+------------------------+\n"
find . -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "


