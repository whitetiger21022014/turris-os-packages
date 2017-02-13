#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flup
PKG_VERSION:=1.0.2
PKG_RELEASE:=2

PKG_SOURCE:=flup-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/f/flup/
PKG_HASH:=4bad317a5fc1ce3d4fe5e9b6d846ec38a8023e16876785d4f88102f2c8097dd9

PKG_LICENSE:=BSD
PKG_LICENSE_FILES:PKG-INFO

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-flup
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-flup
  URL:=http://pypi.python.org/pypi/flup/
  DEPENDS:=+python-light +python-logging
  MAINTAINER:=Hamish Guthrie <hcg@openwrt.org>
endef

define Package/python-flup/description
  Random assortment of WSGI servers
endef

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/flup \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
endef

define Package/python-flup/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/flup \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-flup))
