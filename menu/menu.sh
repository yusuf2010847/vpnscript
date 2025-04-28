#!/bin/bash
 # ========================================= 
 vlx=$(grep -c -E "^#& " "/etc/xray/config.json") 
 let vla=$vlx/2 
 vmc=$(grep -c -E "^### " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
  
 trx=$(grep -c -E "^#! " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^##! " "/etc/xray/config.json") 
 let ssa=$ssx/2
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
#Download/Upload today 
 dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')" 
 utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')" 
 ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')" 
 #Download/Upload yesterday 
 dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')" 
 uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')" 
 tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')" 
 #Download/Upload current month 
 dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')" 
 umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')" 
 tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')" 
 clear
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


x="ok"


PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
fi

#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="${YELL}Active${NC}"
Error="${RED}Expired${NC}"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/yusuf2010847/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}GOOD${NC}"
else
ressh="${RED}BAD${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${y}ON${NC}"
else
ressshws="${RED}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${y}ON${NC}"
else
resngx="${RED}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${y}ON${NC}"
else
resv2r="${RED}OFF${NC}"
fi
###########
KANAN="\033[1;31m<\033[1;31m<\033[1;33m<\033[1;34m$NC"
KIRI="\033[1;34m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
a=" ${CYAN}ACCOUNT PREMIUM" 
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
ISPVPS=$( curl -s ipinfo.io/org )
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
clear
echo -e " ${z}╭═══════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC\033[41m  ${BOLD}              TUNNELING TAOOMATOA                $NC${z}│$NC"
echo -e " ${z}╰═══════════════════════════════════════════════════╯${NC}"
echo -e " ${z}╭═══════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│$NC$Blue ⇲ $NC OS ${NC}      :$NC $MODEL${NC}"
echo -e " ${z}│$NC$Blue ⇲ $NC RAM ${NC}     :$NC $RAM MB $NC"
echo -e " ${z}│$NC$Blue ⇲ $NC DATE ${NC}    :$NC $DATEVPS${NC}"
echo -e " ${z}│$NC$Blue ⇲ $NC CITY ${NC}    :$NC $(wget -qO- ipinfo.io/region)"
echo -e " ${z}│$NC$Blue ⇲ $NC ISP VPS ${NC} :$NC $( curl -s ipinfo.io/org )"
echo -e " ${z}│$NC$Blue ⇲ $NC IP ${NC}      :$NC$y $IPVPS${NC}"
echo -e " ${z}│$NC$Blue ⇲ $NC DOMAIN ${NC}  :$NC$y $domain${NC}"
echo -e " ${z}│$NC$Blue ⇲ $NC UPTIME ${NC}  :$NC $SERONLINE${NC}"
echo -e " ${z}╰═══════════════════════════════════════════════════╯${NC}"
echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | lolcat
echo -e " ${z} $NC\033[0m ${BOLD}${White} SSH     VMESS     VLESS     TROJAN     SHADOWS$NC" 
echo -e " ${z} $NC\033[0m ${y}  $ssh1        $vma         $vla          $tra          $ssa$NC"
echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | lolcat
echo -e " ${z}╭═══════════════════════════════════════════════════╮${NC}"
echo -e "  ${z} ${BIWhite} SSH-WS${NC} : $ressshws" ${z}│"${BIWhite} NGINX${NC} : $resngx" ${z}│"${BIWhite} XRAY${NC}  : $resv2r" ${z}│"   ${NC}$ressh"
echo -e " ${z}╰═══════════════════════════════════════════════════╯${NC}"
echo -e " ${z}   ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮${NC}"
echo -e " ${z}   │$NC  Version $NC   ${Blue}:$NC  $y$(cat /opt/.ver)"
echo -e " ${z}   │$NC  Clien Name$NC ${Blue}:$NC  $YELL$Name \e[0m"
echo -e " ${z}   │$NC  Expiry In $NC ${Blue}:$NC  $sts $RED$certifacate${NC}$YELL Days"
echo -e " ${z}   ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯${NC}"
echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | lolcat
echo -e " ${z}╭═══════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│  $NC ${Blue}1.)${NC} MENU SSH${NC}          ${z}│  $NC ${Blue} 6.)${NC} ADD DOMAIN ${NC}      ${z}│"
echo -e " ${z}│  $NC ${Blue}2.)${NC} MENU VMESS ${NC}       ${z}│  $NC ${Blue} 7.)${NC} UPDATE ${NC}          ${z}│" 
echo -e " ${z}│  $NC ${Blue}3.)${NC} MENU VLESS ${NC}       ${z}│  $NC ${Blue} 8.)${NC} BANDWIDTH ${NC}       ${z}│"  
echo -e " ${z}│  $NC ${Blue}4.)${NC} MENU TROJAN${NC}       ${z}│  $NC ${Blue} 9.)${NC} AUTO REBOT ${NC}      ${z}│"
echo -e " ${z}│  $NC ${Blue}5.)${NC} MENU SHADOW${NC}       ${z}│  $NC ${Blue}10.)${NC} SETTING ${NC}         ${z}│"
echo -e " ${z}╰═══════════════════════════════════════════════════╯${NC}"
echo -e " ${z} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | lolcat
echo 
read -p " Select From Option [1-15 or 0 Exit] : " opt
echo -e ""
case $opt in
1 | 01) clear ; menu-ssh ;;
2 | 02) clear ; menu-vmess ;;
3 | 03) clear ; menu-vless ;;
4 | 04) clear ; menu-trojan ;;
5 | 05) clear ; menu-ss ;;
6 | 06) clear ; addhost ;;
7 | 07) clear ; update ;;
8 | 08) clear ; cek-bandwidth ;;
9 | 09) clear ; autoreboot ;;
10) clear ; menu-set ;;
0) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
