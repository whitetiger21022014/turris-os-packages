#
## Copyright (C) 2016 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.9.0
PKG_SOURCE_URL:=https://static.rust-lang.org/dist/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tar.gz
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
HOST_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Rust
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Rust programing language compiler
  URL:=https://www.rust-lang.org
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
endef

define Host/Prepare
	$(PKG_UNPACK)
	rm -rf $(BUILD_DIR)/$(PKG_NAME)
	mv $(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION) $(HOST_BUILD_DIR)
	$(call Build/Patch)

endef


HOST_CONFIGURE_VARS := 

HOST_CONFIGURE_ARGS :=\
		--target=arm-unknown-linux-musl \
		--disable-docs \
		--prefix=$(STAGING_DIR_HOST) \
		--disable-jemalloc 

define Host/Configure
	$(call Host/Configure/Default)
endef


MAKE_VARS:= \
	LD_LIBRARY_PATH=$(STAGING_DIR_ROOT)/../usr/include \

MAKE_FLAGS:=

define Host/Compile
	$(call Build/Compile/Default, rustc-stage1 )
endef

define Host/Install
	$(call Host/Install/Default)
endef

define Host/Clean
	#$(STAGING_DIR_HOST)/lib/rustlib/uninstall.sh
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,$(PKG_NAME)))
