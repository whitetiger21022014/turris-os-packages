#
## Copyright (C) 2016 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

ARCH_BITS := $(shell getconf LONG_BIT)
ifeq ($(ARCH_BITS),64)
PKG_ARCH:=x86_64
else
PKG_ARCH:=i686
endif

PKG_NAME:=rust-cargo
PKG_VERSION:=0.10.0
PKG_SOURCE_URL:=https://static.rust-lang.org/cargo-dist/
PKG_FULL_NAME:=cargo-nightly-$(PKG_ARCH)-unknown-linux-gnu
PKG_SOURCE:=$(PKG_FULL_NAME).tar.gz
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
HOST_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Rust
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+rustc
  TITLE:=Cargo, Rust package manager
  URL:=https://crates.io
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
	rm -rf $(HOST_BUILD_DIR)
	mv $(BUILD_DIR)/$(PKG_FULL_NAME) $(HOST_BUILD_DIR)
	$(call Build/Patch)
endef

define Host/Configure
endef

define Host/Compile
endef

define Host/Install
	$(HOST_BUILD_DIR)/install.sh --prefix=$(STAGING_DIR_HOST)
endef

define Host/Clean
#	$(STAGING_DIR_HOST)/lib/rustlib/uninstall.sh
endef


$(eval $(call HostBuild))
$(eval $(call BuildPackage,$(PKG_NAME)))
