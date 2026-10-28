FILESEXTRAPATHS:prepend := "${THISDIR}/files:${NMC_BSP_DIR}/uboot:"
SRC_URI:append = " file://mpfs-nmc-uboot.dts file://nmc_defconfig file://yocto-boot.cfg"

# U-Boot config: the same defconfig Buildroot uses (../uboot/nmc_defconfig), in place of
# Microchip's microchip_mpfs_icicle_defconfig. Microchip's mpfs-icicle-kit.cfg (U-Boot env
# on partition 1) and yocto-boot.cfg (distro boot via boot.scr) keep Yocto's boot flow.
UBOOT_MACHINE:mpfs-icicle-kit = "nmc_defconfig"

do_configure:prepend() {
    cp ${WORKDIR}/mpfs-nmc-uboot.dts ${S}/dts/upstream/src/riscv/microchip/mpfs-icicle-kit.dts
    cp ${WORKDIR}/nmc_defconfig ${S}/configs/nmc_defconfig
}
