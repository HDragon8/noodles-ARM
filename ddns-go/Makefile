# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021-2025 sirpdboy  <herboy2008@gmail.com>
# 
# This is free software, licensed under the Apache License, Version 2.0 .
#
include $(TOPDIR)/rules.mk

PKG_NAME:=ddns-go
PKG_VERSION:=6.12.0
PKG_RELEASE:=11

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jeessy2/ddns-go/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=skip


PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=herboy2008 <herboy2008@gmail.com>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/jeessy2/ddns-go/v6
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/ddns-go
  TITLE:=A Linux web GUI client of ddns-go
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
  URL:=https://github.com/jeessy2/ddns-go
  USERID:=ddns-go:ddns-go
endef

define Package/ddns-go/description
  ddns-go is a automatically obtain your public IPv4 or IPv6 address and resolve it to the corresponding domain name service,
  support Alidns Dnspod Cloudflare Hicloud Callback Baiducloud porkbun GoDaddy Google Domains.
endef

define Package/ddns-go/install
	$(call GoPackage/Package/Install/Bin,$(1))

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(CURDIR)/file/ddns-go.init $(1)/etc/init.d/ddns-go
	$(INSTALL_DIR) $(1)/usr/libexec
	$(INSTALL_BIN) $(CURDIR)/file/ddns-go-call.libexec $(1)/usr/libexec/ddns-go-call
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) $(CURDIR)/file/luci-ddns-go.uci-default $(1)/etc/uci-defaults/luci-ddns-go
endef

$(eval $(call GoBinPackage,ddns-go))
$(eval $(call BuildPackage,ddns-go))
