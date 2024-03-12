#
# SPDX-FileCopyrightText: 2023 3mdeb <contact@3mdeb.com>
#
# SPDX-License-Identifier: MIT

## Code here runs inside the initialize() function
## Use it for anything that you need to run before any other function, like
## setting environment variables:
## CONFIG_FILE=settings.ini
##
## Feel free to empty (but not delete) this file.
#

# vim formula for semiautomatic conversion of repositories into required format:
# s,https://gitlab.com/3mdeb/\(.*\),["\1"]="https://gitlab.com/3mdeb/\1",

# Dasharo upstream
# declare -A -g REPOS=(
# 	["coreboot"]="https://review.coreboot.org/coreboot.git"
#     ["flashrom"]="https://review.coreboot.org/flashrom.git"
#     ["fwupd"]="https://github.com/fwupd/fwupd.git"
#     ["seabios"]="https://review.coreboot.org/seabios.git"
# )

# Zarhus upstream
declare -A -g REPOS=(
	["armbian-build"]="https://github.com/armbian/build.git"
	["chirpstack-gateway-os"]="https://github.com/chirpstack/chirpstack-gateway-os.git"
	["cukinia"]="https://github.com/savoirfairelinux/cukinia.git"
	["debos"]="https://github.com/go-debos/debos.git"
	["isar"]="https://github.com/ilbers/isar.git"
	["kas"]="https://github.com/siemens/kas.git"
	["libwpe"]="https://github.com/WebPlatformForEmbedded/libwpe.git"
	["linux"]="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
	["meta-eid"]="https://github.com/eid-project/meta-eid.git"
	["meta-measured"]="https://github.com/flihp/meta-measured"
	["meta-openembedded"]="https://github.com/openembedded/meta-openembedded.git"
	["meta-openwrt"]="https://github.com/kraj/meta-openwrt.git"
	["meta-riscv"]="https://github.com/riscv/meta-riscv.git"
	["meta-riscv"]="https://github.com/riscv/meta-riscv.git"
	["meta-security"]="https://git.yoctoproject.org/meta-security"
	["meta-sunxi"]="https://github.com/linux-sunxi/meta-sunxi.git"
	["meta-swupdate"]="https://github.com/sbabic/meta-swupdate.git"
	["meta-virtualization"]="git://git.yoctoproject.org/meta-virtualization"
	["meta-webkit"]="https://github.com/Igalia/meta-webkit.git"
	["poky"]="git://git.yoctoproject.org/poky"
	["rpi-build"]="https://github.com/notro/rpi-build.git"
	["swupdate"]="https://github.com/sbabic/swupdate.git"
	["systemd"]="https://github.com/systemd/systemd.git"
	["u-boot"]="https://source.denx.de/u-boot/u-boot.git"
)

# Zarhus own repos
# declare -A -g REPOS=(
# 	["meta-amd"]="https://github.com/3mdeb/meta-amd.git"
# 	["meta-balena-engine"]="https://github.com/3mdeb/meta-balena-engine.git"
# 	["meta-cloud-services"]="https://github.com/3mdeb/meta-cloud-services.git"
# 	["meta-dasharo-isar"]="git@gitlab.com:3mdeb/dasharo/meta-dasharo-isar.git"
# 	["meta-dts"]="https://github.com/Dasharo/meta-dts.git"
# 	["meta-eid"]="https://github.com/3mdeb/meta-eid.git"
# 	["meta-fdo"]="https://github.com/3mdeb/meta-fdo.git"
# 	["meta-gateworks-bsp"]="git@gitlab.com:3mdeb/trainings/meta-gateworks-bsp.git"
# 	["meta-imx"]="https://github.com/3mdeb/meta-imx.git"
# 	["meta-imx8"]="https://github.com/3mdeb/meta-imx8.git"
# 	["meta-influx"]="https://github.com/3mdeb/meta-influx.git"
# 	["meta-marvell-3mdeb"]="git@gitlab.com:3mdeb/embedded-firmware-team/meta-marvell-3mdeb.git"
# 	["meta-nvidia"]="https://github.com/3mdeb/meta-nvidia.git"
# 	["meta-ocaml"]="https://github.com/3mdeb/meta-ocaml.git"
# 	["meta-openembedded"]="https://github.com/3mdeb/meta-openembedded.git"
# 	["meta-openwrt"]="https://github.com/3mdeb/meta-openwrt.git"
# 	["meta-pcengines"]="https://github.com/pcengines/meta-pcengines.git"
# 	["meta-ppc64"]="https://github.com/3mdeb/meta-ppc64.git"
# 	["meta-raspberrypi"]="https://github.com/3mdeb/meta-raspberrypi.git"
# 	["meta-readonly-rootfs-overlay"]="https://github.com/3mdeb/meta-readonly-rootfs-overlay.git"
# 	["meta-riscv"]="https://github.com/3mdeb/meta-riscv.git"
# 	["meta-rockchip"]="https://github.com/3mdeb/meta-rockchip.git"
# 	["meta-rte"]="https://github.com/3mdeb/meta-rte.git"
# 	["meta-rust"]="https://github.com/3mdeb/meta-rust.git"
# 	["meta-safeboot"]="https://github.com/3mdeb/meta-safeboot.git"
# 	["meta-srtm"]="git@gitlab.com:3mdeb/srtm/meta-srtm.git"
# 	["meta-sunxi"]="https://github.com/3mdeb/meta-sunxi.git"
# 	["meta-tb-isar-dev"]="https://github.com/3mdeb/meta-tb-isar-dev.git"
# 	["meta-training"]="git@gitlab.com:3mdeb/trainings/meta-training.git"
# 	["meta-training-qemu"]="git@gitlab.com:3mdeb/trainings/meta-training-qemu.git"
# 	["meta-trenchboot"]="https://github.com/3mdeb/meta-trenchboot.git"
# 	["meta-trenchboot-attestation"]="https://github.com/3mdeb/meta-trenchboot-attestation.git"
# 	["meta-trenchboot-demo"]="https://github.com/3mdeb/meta-trenchboot-demo.git"
# 	["meta-vbox"]="https://github.com/3mdeb/meta-vbox.git"
# 	["meta-virtualization"]="https://github.com/3mdeb/meta-virtualization.git"
# 	["meta-zulu-java"]="https://github.com/3mdeb/meta-zulu-java.git"
# 	["oe-meta-go"]="https://github.com/3mdeb/oe-meta-go.git"
# )

# Other 3mdeb contribution
# declare -A -g REPOS=(
#     ["DPorts"]="https://github.com/DragonFlyBSD/DPorts.git"
#     ["DragonFlyBSD"]="https://github.com/DragonFlyBSD/DragonFlyBSD.git"
#     ["Octopress-LastFM-Aside"]="https://github.com/sankroh/Octopress-LastFM-Aside.git"
#     ["PSPTool"]="https://github.com/PSPReverse/PSPTool.git"
#     ["QCBOR"]="https://github.com/laurencelundblade/QCBOR.git"
#     ["TrenchBoot.github.io"]="https://github.com/TrenchBoot/TrenchBoot.github.io.git"
#     ["acpica"]="https://github.com/acpica/acpica.git"
#     ["ansible-role-customize-gnome"]="https://github.com/PeterMosmans/ansible-role-customize-gnome.git"
#     ["backends"]="https://gitlab.com/sane-project/backends.git"
#     ["batch2bash"]="https://github.com/gajop/batch2bash.git"
#     ["charra"]="https://github.com/Fraunhofer-SIT/charra.git"
#     ["documentation"]="https://github.com/TrenchBoot/documentation.git"
#     ["ec"]="https://github.com/system76/ec.git"
#     ["efivar"]="https://github.com/rhboot/efivar"
#     ["fiedka"]="https://github.com/fiedka/fiedka.git"
#     ["freebsd-ports"]="https://github.com/freebsd/freebsd-ports.git"
#     ["freebsd-src"]="https://git.FreeBSD.org/src.git"
#     ["homepage"]="https://review.coreboot.org/homepage.git"
#     ["landing-zone"]="https://github.com/TrenchBoot/landing-zone.git"
#     ["libwpe"]="https://github.com/WebPlatformForEmbedded/libwpe.git"
#     ["netbsd-pkgsrc"]="https://github.com/NetBSD/pkgsrc.git"
#     ["netbsd-src"]="https://github.com/NetBSD/src.git"
#     ["openbsd-ports"]="https://github.com/openbsd/ports.git"
#     ["openbsd-src"]="https://github.com/openbsd/src.git"
#     ["pycom-documentation"]="https://github.com/pycom/pycom-documentation.git"
#     ["qubes-antievilmaid"]="https://github.com/QubesOS/qubes-antievilmaid.git"
#     ["qubes-app-linux-split-gpg2"]="https://github.com/HW42/qubes-app-linux-split-gpg2.git"
#     ["qubes-builder-rpm"]="https://github.com/QubesOS/qubes-builder-rpm.git"
#     ["trenchboot-issues"]="https://github.com/TrenchBoot/trenchboot-issues.git"
#     ["xen"]="git://xenbits.xen.org/xen.git"
# )

REPOS_DIR="repos"
