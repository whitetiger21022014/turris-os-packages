#
## Copyright (C) 2016 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=arrow-client
PKG_VERSION:=0.6.0
PKG_SOURCE_URL:=https://github.com/angelcam/arrow-client/archive/
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/target/arm-unknown-linux-musl/release
PKG_BUILD_DEPENDS +=rustc rust-cargo 

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/turrispackages/lang/rust-cargo/files/package-rustcargo.mk

define Package/$(PKG_NAME)
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libopenssl
  TITLE:=Arrow Client
  URL:=https://github.com/angelcam/arrow-client/
endef

define Package/$(PKG_NAME)/description
 Arrow Client is an application used to 
 simplify the process of connecting IP cameras
 to the Angelcam cloud services
endef

define Build/Prepare
	$(PKG_UNPACK)
	rm -rf $(BUILD_DIR)/$(PKG_NAME)
	mv $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION) $(BUILD_DIR)/$(PKG_NAME)
	$(call Build/Patch)

endef

define Build/Configure
	$(call Build/Configure/RustCargo)
endef

define Build/Compile
	$(call Build/Compile/RustCargo)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/arrow-client $(1)/usr/bin
endef


$(eval $(call BuildPackage,$(PKG_NAME)))

