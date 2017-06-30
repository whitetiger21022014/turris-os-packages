#
# Copyright (C) 2017 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pyfttt
PKG_VERSION:=ec0f87f87d2f852cda033c6dac309464f85be60a
PKG_RELEASE:=1
PKG_LICENSE:=BSD-2-Clause

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/briandconnelly/pyfttt.git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/$(PKG_NAME)
	SUBMENU:=Python
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=pyfttt
	URL:=https://github.com/briandconnelly/pyfttt
	MAINTAINER:=CZ.NIC <packaging@turris.cz>
	DEPENDS:=+python
endef

define Package/$(PKG_NAME)/description
 Python tools for interacting with IFTTT Maker Channel.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="/usr" --root="$(PKG_INSTALL_DIR)")
endef

define PyPackage/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) ./files/pyfttt $(1)/usr/bin/pyfttt
endef

$(eval $(call PyPackage,pyfttt))
$(eval $(call BuildPackage,pyfttt))
