
#
## Copyright (C) 2016 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
## include $(TOPDIR)/rules.mk

RUST_PKG_DIR:=$(BUILD_DIR)/$(PKG_NAME)
RUST_PKG_CONFIG:=$(RUST_PKG_DIR)/.cargo/config


MAKE_VARS:=\
	PATH=$(TOOLCHAIN_DIR)/bin/:$(STAGING_DIR_HOST)/bin:$(PATH) \
	CC=$(TOOLCHAIN_DIR)/bin/arm-openwrt-linux-muslgnueabi-gcc \
	D_LIBRARY_PATH=/home/cz_nic/data/src/openwrt_omnia/staging_dir/target-arm_cortex-a9+vfpv3_musl-1.1.11_eabi/usr/include

MAKE_ARGS:=\
	--target=arm-unknown-linux-musl \
	--verbose \
	--release

MAKE:=$(STAGING_DIR_HOST)/bin/cargo



define Build/Prepare/RustCargo
endef

define Build/Configure/RustCargo
	[[ -d $(RUST_PKG_DIR)/.cargo ]] || mkdir $(RUST_PKG_DIR)/.cargo
	echo "[target.arm-unknown-linux-musl]">$(RUST_PKG_CONFIG)
	echo 'linker="$(TOOLCHAIN_DIR)/bin/arm-openwrt-linux-muslgnueabi-gcc"'>>$(RUST_PKG_CONFIG)
	echo 'ar="$(TOOLCHAIN_DIR)/bin/arm-openwrt-linux-muslgnueabi-ar"'>>$(RUST_PKG_CONFIG)
endef

define Build/Compile/RustCargo
	(cd $(RUST_PKG_DIR); \
	$(MAKE_VARS) $(MAKE) build $(MAKE_ARGS) \
	)
endef

