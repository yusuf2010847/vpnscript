#!/bin/bash

clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM"

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
clear
echo -e " ${z}╭════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC\033[41m                 MENU SETTING               $NC${z}│$NC"
echo -e " ${z}╰════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC ${Blue} 1.)${NC} Renew CertXRAY $NC" 
echo -e " ${z}│$NC ${Blue} 2.)${NC} Change Banner SSH $NC "
echo -e " ${z}│$NC ${Blue} 3.)${NC} Restart $NC "
echo -e " ${z}│$NC ${Blue} 4.)${NC} Reboot $NC "
echo -e " ${z}│$NC ${Blue} 5.)${NC} Speedtest $NC "
echo -e " ${z}│$NC ${Blue} 6.)${NC} Limit Speed $NC "
echo -e " ${z}│$NC ${Blue} 7.)${NC} Install UDP $NC "
echo -e " ${z}│$NC ${Blue} 8.)${NC} Info Port $NC "
echo -e " ${z}│$NC ${Blue} 9.)${NC} Running $NC "
echo -e " ${z}│$NC ${Blue}10.)${NC} Backup $NC "
echo -e " ${z}│$NC ${Blue}11.)${NC} Webmin $NC "
echo -e " ${z}│$NC"
echo -e " ${z}│$NC ${BIRed} 0.)${NC}$purple Back To Menu "
echo -e " ${z}╰════════════════════════════════════════════╯${NC}"
echo -e ""
read -p "  Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; certxray ;;
2) clear ; nano /etc/issue.net ;;
3) clear ; restart ;;
4) clear ; reboot ;;
5) clear ; speedtest ;;
6) clear ; limitspeed ;;
7) clear ;  clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
8) clear ; info ;;
9) clear ; running ;;
10) clear ; menu-backup ;;
11) clear ; webmin ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) clear ; menu-set ;;
esac

