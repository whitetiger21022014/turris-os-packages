#
# Copyright (C) 2013 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=Beaker
PKG_VERSION:=1.6.4
PKG_RELEASE:=2

PKG_SOURCE:=Beaker-1.6.4.tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/B/Beaker/
PKG_HASH:=5b06dcc9f7b1921bc962235c4051aa5f3f5d3609f42faa6064dc614ace031a3a

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-beaker
	SUBMENU:=Python
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=python-beaker
	URL:=http://beaker.readthedocs.org
	DEPENDS:=+python-light +python-logging +python-openssl
	MAINTAINER:=Jan Cermak <jan.cermak@nic.cz>
endef

define Package/python-beaker/description
	A Session and Caching library with WSGI Middleware
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="/usr" --root="$(PKG_INSTALL_DIR)" \
	)
endef

define Package/python-beaker/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call BuildPackage,python-beaker))
