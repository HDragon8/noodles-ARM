#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/HDragon8/A-default-settings A-default-settings
git clone --depth 1 https://github.com/kiddin9/luci-theme-edge
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages && mvdir openwrt-passwall-packages
git clone --depth 1 https://github.com/fw876/helloworld && mvdir helloworld
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./ ; rm -rf aliyundrive
git clone --depth 1 https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./;rm -rf aliyundrive
git clone --depth 1 https://github.com/ElvenP/luci-app-onliner
git clone --depth 1 https://github.com/rufengsuixing/luci-app-usb3disable
git clone --depth 1 https://github.com/riverscn/openwrt-iptvhelper && mvdir openwrt-iptvhelper
git clone --depth 1 https://github.com/sbwml/luci-app-openlist && mvdir luci-app-openlist
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff
git clone --depth 1 https://github.com/noiver/luci-app-jd-dailybonus
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
git clone --depth 1 https://github.com/LGA1150/openwrt-sysuh3c && mvdir openwrt-sysuh3c

rm -rf v2ray-geodata
rm -rf mosdns && rm -rf luci-app-mosdns
git clone --depth 1 -b v5 https://github.com/sbwml/luci-app-mosdns openwrt-mos && mv -n openwrt-mos/{*mosdns,v2dat} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sbwml/v2ray-geodata

git clone --depth 1 https://github.com/pymumu/luci-app-smartdns
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/* ./; rm -rf dockerman
git clone --depth 1 https://github.com/linkease/nas-packages && mv -n nas-packages/{network/services/*,multimedia/*} ./; rm -rf nas-packages
git clone --depth 1 https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/* ./; rm -rf nas-packages-luci
git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git clone --depth 1 https://github.com/linkease/openwrt-app-actions && mv -n openwrt-app-actions/applications/* ./;rm -rf openwrt-app-actions
git clone --depth 1 https://github.com/sirpdboy/luci-app-lucky
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddns-go1 && mvdir ddns-go1
# git clone --depth 1 https://github.com/sirpdboy/netspeedtest && mvdir netspeedtest
git clone --depth 1 https://github.com/gngpp/luci-theme-design
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/sirpdboy/chatgpt-web
git clone --depth 1 https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
git clone --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon wrtbwmon1 && mvdir wrtbwmon1
git clone --depth 1 https://github.com/brvphoenix/wrtbwmon wrtbwmon2 && mvdir wrtbwmon2

#git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpkg" net/miniupnpd net/mwan3 multimedia/UnblockNeteaseMusic-Go \
#multimedia/UnblockNeteaseMusic net/amule net/antileech net/baidupcs-web net/frp multimedia/gmediarender net/go-aliyundrive-webdav \
#net/qBittorrent-static net/qBittorrent net/transmission net/phtunnel libs/qtbase libs/qttools libs/rblibtorrent \
#net/uugamebooster net/verysync net/vlmcsd net/dnsforwarder net/nps net/tcpping net/netatalk net/pgyvpn net/n2n net/ntpclient net/gowebdav
#mv -f miniupnpd miniupnpd-iptables
#git_sparse_clone master "https://github.com/coolsnowwolf/luci" "leluci" applications libs/luci-lib-fs
#mv -f applications luciapp
#git_sparse_clone master "https://github.com/coolsnowwolf/lede" "leanlede" package/lean package/network/services/shellsync package/network/services/e2guardian
#mv -n lean/* luciapp/; rm -rf lean
#rm -rf luciapp/default-settings
#rm -rf luciapp/autocore
#rm -rf luciapp/automount
#rm -rf luciapp/ipv6-helper

#git_sparse_clone openwrt-23.05 "https://github.com/immortalwrt/packages" "immpkgs" net/mwol \
#net/sub-web net/dnsproxy net/haproxy net/v2raya net/cdnspeedtest net/keepalived net/dae net/modemband \
#net/subconverter net/ngrokc net/oscam net/njitclient net/scutclient net/gost  net/dufs \
#libs/jpcre2 libs/wxbase libs/rapidjson libs/libcron libs/quickjspp libs/toml11 \
#utils/cpulimit utils/filebrowser utils/cups net/udp2raw net/msd_lite net/xfrpc net/bitsrunlogin-go \
#utils/phicomm-k3screenctrl net/apinger net/basicstation libs/sx1302_hal sound/spotifyd
#git_sparse_clone openwrt-23.05 "https://github.com/immortalwrt/immortalwrt" "immortal" package/emortal/autocore package/emortal/automount package/emortal/ipv6-helper \
#package/utils/mhz
#package/network/utils/fullconenat package/network/utils/fullconenat-nft
#git_sparse_clone openwrt-23.05 "https://github.com/immortalwrt/luci" "immluci" applications protocols/luci-proto-minieap
#mv -n applications/* luciapp/; rm -rf applications

#mv -n luciapp/* ./ ; rm -Rf luciapp
#svn export https://github.com/coolsnowwolf/luci/trunk/libs/luci-lib-ipkg
#svn export https://github.com/x-wrt/packages/trunk/net/nft-qos
#svn export https://github.com/x-wrt/luci/trunk/applications/luci-app-nft-qos
#svn export https://github.com/Lienol/openwrt-package/branches/other/lean/luci-app-autoreboot
#svn export https://github.com/Ysurac/openmptcprouter-feeds/trunk/luci-app-iperf
#svn export https://github.com/QiuSimons/OpenWrt-Add/trunk/luci-app-irqbalance
#svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit
#svn export https://github.com/xiaoxifu64/immortalwrt/trunk/package/rooter/ext-rooter-basic
#svn export https://github.com/openwrt/luci/branches/openwrt-22.03/applications/luci-app-wireguard
#svn export https://github.com/lucikap/Brukamen/trunk/luci-app-ua2f
#svn export https://github.com/openwrt/packages/trunk/net/shadowsocks-libev
#svn export https://github.com/kenzok8/jell/trunk/vsftpd-alt
#svn export https://github.com/kenzok8/jell/trunk/luci-app-bridge

#git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpack" net/miniupnpd net/mwan3 \
#net/amule net/baidupcs-web multimedia/gmediarender net/go-aliyundrive-webdav \
#net/verysync net/dnsforwarder net/nps net/tcpping
#mv -f miniupnpd miniupnpd-iptables

#git_sparse_clone openwrt-23.05 "https://github.com/openwrt/packages" "22packages" \
#utils/cgroupfs-mount utils/coremark utils/watchcat utils/dockerd net/nginx net/uwsgi net/ddns-scripts \
#net/ariang admin/netdata net/transmission-web-control net/rp-pppoe net/tailscale
#git_sparse_clone openwrt-23.05 "https://github.com/openwrt/openwrt" "openwrt" \
#package/base-files package/network/config/firewall4 package/network/config/firewall package/system/opkg package/network/services/ppp \
#package/network/services/dnsmasq package/libs/openssl

#git_sparse_clone master "https://github.com/immortalwrt/packages" "immpack" net/sub-web net/dnsproxy net/haproxy net/cdnspeedtest \
#net/uugamebooster net/subconverter net/ngrokc net/oscam net/njitclient net/scutclient net/gowebdav net/udp2raw \
#admin/btop libs/wxbase libs/rapidjson libs/libcron libs/quickjspp libs/toml11 libs/libtorrent-rasterbar \
#libs/libdouble-conversion libs/qt6base libs/cxxopts libs/jpcre2 libs/alac \
#utils/cpulimit devel/gn

#git_sparse_clone develop "https://github.com/Ysurac/openmptcprouter-feeds" "enmptcp" luci-app-snmpd \
#luci-app-packet-capture luci-app-mail msmtp
#git_sparse_clone master "https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng" "xiaoqingfeng" homeredirect luci-app-homeredirect

#git_sparse_clone master "https://github.com/x-wrt/packages" "x-wrtpack" net/nft-qos
#git_sparse_clone master "https://github.com/x-wrt/luci" "x-wrtluci" applications/luci-app-nft-qos
#git_sparse_clone master "https://github.com/x-wrt/com.x-wrt" "x-wrt" natflow lua-ipops luci-app-macvlan luci-app-3ginfo-lite luci-app-fakemesh urllogger
#git_sparse_clone master "https://github.com/immortalwrt/immortalwrt" "immortal" package/network/utils/nftables \
#package/network/utils/fullconenat package/network/utils/fullconenat-nft \
#package/utils/mhz package/libs/libnftnl package/firmware/wireless-regdb

#git_sparse_clone master "https://github.com/sbwml/openwrt_pkgs" "openwrt_pkgs" luci-app-gowebdav luci-app-ota luci-app-socat \
#git_sparse_clone openwrt-23.05 "https://github.com/openwrt/luci" "opluci" applications/luci-app-watchcat \

#mv -n openwrt-passwall/* ./ ; rm -Rf openwrt-passwall
#rm -rf openssl
#mv -n openwrt-package/* ./ ; rm -Rf openwrt-package
#mv -n openwrt-app-actions/applications/* ./;rm -rf openwrt-app-actions
sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
-e 's/php7/php8/g' \
-e 's/+docker /+docker +dockerd /g' \
*/Makefile

#删除没有依赖的包
rm -rf luci-app-samba
rm -rf luci-app-netspeedtest
rm -rf sendat
rm -rf sms-tool
rm -rf luci-app-wrtbwmon
rm -rf wrtbwmon

sed -i 's/PKG_VERSION:=20240302/PKG_VERSION:=20240223/g; s/PKG_RELEASE:=$(AUTORELESE)/PKG_RELEASE:=1/g' webd/Makefile
sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' luci-app-docker*/Makefile
sed -i '$i /etc/init.d/dockerd restart &' luci-app-docker*/root/etc/uci-defaults/*
sed -i 's/+libcap /+libcap +libcap-bin /' luci-app-openclash/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-design/' luci-app-design-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argone/' luci-app-argone-config/Makefile
sed -i 's/+vsftpd-alt$/+vsftpd/' luci-app-tencentcloud-cos/Makefile
sed -i 's/ +uhttpd-mod-ubus//' luci-app-packet-capture/Makefile
sed -i 's/	ip.neighbors/	luci.ip.neighbors/' luci-app-wifidog/luasrc/model/cbi/wifidog/wifidog_cfg.lua
#sed -i -e 's/nas/services/g' -e 's/NAS/Services/g' $(grep -rl 'nas\|NAS' luci-app-fileassistant)
#sed -i -e 's/nas/services/g' -e 's/NAS/Services/g' $(grep -rl 'nas\|NAS' luci-app-alist)
#find . -type f -name Makefile -exec sed -i 's/PKG_BUILD_FLAGS:=no-mips16/PKG_USE_MIPS16:=0/g' {} +
sed -i '/entry({"admin", "nas"}, firstchild(), "NAS", 45).dependent = false/d; s/entry({"admin", "network", "eqos"}, cbi("eqos"), _("EQoS"))/entry({"admin", "network", "eqos"}, cbi("eqos"), _("EQoS"), 121).dependent = true/' luci-app-eqos/luasrc/controller/eqos.lua
#sed -i '65,73d' adguardhome/Makefile
sed -i 's/PKG_SOURCE_DATE:=2/PKG_SOURCE_DATE:=3/' transmission-web-control/Makefile
find . -type f -name "update.sh" -exec rm -f {} \;
rm -rf adguardhome/patches
exit 0

