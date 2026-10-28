FILESEXTRAPATHS:prepend := "${NMC_BSP_DIR}/linux:"
SRC_URI:append = " file://mpfs-nmc-linux.dts"

do_configure:prepend() {
    cp ${WORKDIR}/mpfs-nmc-linux.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
    cp ${WORKDIR}/mpfs-nmc-linux.dts ${S}/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
}

# Kernel config: the same defconfig Buildroot uses (../linux/nmc_defconfig), installed
# in the kernel tree in place of Microchip's mpfs_defconfig.
# Microchip's Icicle Kit fragments are dropped so both builds get the same config.
KBUILD_DEFCONFIG:mpfs-icicle-kit = "nmc_defconfig"
SRC_URI:remove = "file://qspi_flash.cfg file://rpi_sense_hat.cfg file://mcp23s08_spi.cfg"
do_kernel_metadata[file-checksums] += "${NMC_BSP_DIR}/linux/nmc_defconfig:True"

do_kernel_metadata:prepend() {
    cp ${NMC_BSP_DIR}/linux/nmc_defconfig ${S}/arch/riscv/configs/nmc_defconfig
}
