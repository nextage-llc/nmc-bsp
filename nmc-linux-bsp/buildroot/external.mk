# NMC device trees, shared with Yocto (../linux, ../uboot).
# Microchip's Icicle Kit build names the board DTBs mpfs-icicle-kit*, so the NMC
# sources are copied over those files. Pre-build hooks run on every
# linux-rebuild / uboot-rebuild, so DTS edits are picked up without a dirclean.
NMC_BSP_DIR = $(BR2_EXTERNAL_NMC_PATH)/..

define NMC_LINUX_INSTALL_DTS
	cp $(NMC_BSP_DIR)/linux/mpfs-nmc-linux.dts $(LINUX_DIR)/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
	cp $(NMC_BSP_DIR)/linux/mpfs-nmc-linux.dts $(LINUX_DIR)/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
endef
LINUX_PRE_BUILD_HOOKS += NMC_LINUX_INSTALL_DTS

define NMC_UBOOT_INSTALL_DTS
	cp $(NMC_BSP_DIR)/uboot/mpfs-nmc-uboot.dts $(UBOOT_DIR)/dts/upstream/src/riscv/microchip/mpfs-icicle-kit.dts
endef
UBOOT_PRE_BUILD_HOOKS += NMC_UBOOT_INSTALL_DTS
