#!/bin/bash
clear
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
IPVPN=$(curl -s ipinfo.io/ip )
echo " hello this tools from @SNIFF_DSO groub "
sleep 3
clear
echo ""
figlet -f small -t "      SNIFF TOOLS"
echo -e "                                         based on tshark"
echo -e ""
echo -e "    1)  \e[0;32mSNIFF BUG SSL/TLS\e[0m"
echo -e "    2)  \e[0;32mSNIFF BUG PAYLOAD\e[0m"
echo -e "    3)  \e[0;32mDELETE LOG SNIFF\e[0m"
echo -e ""
echo -e "   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "    about)   about this script"
echo -e "    x)       exit from script"
echo -e "   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "     Please Input Number  [1-3 about or x] : " snip
case $snip in
1)
clear
tshark -i any -n -T fields -e tls.handshake.extensions_server_name -e dns.qry.name -e ip.dst -e tcp.dstport -f "host $IPVPN"
;;
2)
tshark -i any -n -Y "http.unknown_header or http.request.method" -O http -T json | grep 'http.request.line\|http.connection\|ip.dst_host\|tcp.dstport\|http.request.method\|http.request.uri\|http.request.version'
;;
3)
echo ""
echo ""
read -p "Apakah Anda Ingin Menghapus Log Hasil Sniff: "  pilihan
if [[ "$pilihan" = 'ok' ]]; then
rm -rf /data/data/com.termux/files/home/.suroot/.cache/termshark/termshark.log
rm -rf /data/data/com.termux/files/home/.suroot/.cache/termshark/pcaps
rm -rf /data/data/com.termux/files/home/.suroot/.cache/termshark/empty.pcap
clear
echo "delete trash log sniff sukses"
else
echo "anda tidak memilih ok"
exit
fi
;;
about)
echo ""
echo "     credit :"
echo "     this script not for sell ! free for all"
echo "     this script from @SNIFF_DSO"
echo "     please join groub telegram"
;;
x)
exit
;;
*)
echo "Please enter an correct number"
;;
esac
