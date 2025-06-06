#wget https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main
GitUser="vpnscript"
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main/version )
clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}( $version )${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error=" ${Green_font_prefix}( $ver )${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main/newversion | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m         UPDATE SCRIPT TUNELLING TAOOMATOA      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   \e[$below Versi Sekarang $Info1"
echo -e "   \e[$below Versi Terbaru $sts"
echo -e""
echo -e""
echo -e "            \e[0;32m[ Select Option ]\033[0m"
echo -e "     \e[$number [01]\e[m \e[$below Update Ke Versi Terbaru\e[m"
echo -e "     \e[$number [00]\e[m \e[$below Kembali Ke Home\e[m"
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[$line"
read -p "Select Menu: " option2
case $option2 in
1)
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main/newversion | grep $version )
if [ $version = $new_version ]; then
clear
echo ""
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "\e[1;31mUpdate Not Available\e[m"
echo ""
clear
sleep 1
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 2
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""
# UPDATE RUN-UPDATE
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main/options/update.sh"
chmod +x run-update
# RUN UPDATE
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/usernew.sh"
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/add-ws.sh"
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/add-ssws.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/add-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/add-tr.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/running.sh"
#wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/arzvpn/Arzv/main/options/cek-trafik.sh"
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/tools/speedtest_cli.py"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/cek-bandwidth.sh"
wget -q -O /usr/bin/limitspeed "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/limitspeed.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-ss.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-backup.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu.sh"
wget -q -O /usr/bin/webmin "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/webmin.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/xp.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/update.sh"
wget -q -O /usr/bin/addhost "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/addhost.sh"
wget -q -O /usr/bin/certxray "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/crt.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/menu/menu-set.sh"
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/info.sh"
wget -q -O /usr/bin/infoserv "https://raw.githubusercontent.com/yusuf2010847/vpnscript/main/options/infoserv.sh"
chmod +x /usr/bin/usernew
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/add-ssws
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/add-tr
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/running
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/limitspeed
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu
chmod +x /usr/bin/webmin
chmod +x /usr/bin/xp
chmod +x /usr/bin/update
chmod +x /usr/bin/addhost
chmod +x /usr/bin/certxray
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/info
chmod +x /usr/bin/infoserv
clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/yusuf2010847/${GitUser}/main/version )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
rm -f update.sh
clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m         UPDATE SCRIPT TUNELLING TAOOMATOA      \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
0)
clear
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
esac
