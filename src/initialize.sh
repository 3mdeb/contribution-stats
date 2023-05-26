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

declare -A -g REPOS=(
    ["DPorts"]="https://github.com/DragonFlyBSD/DPorts.git"
    ["DragonFlyBSD"]="https://github.com/DragonFlyBSD/DragonFlyBSD.git"
    ["Octopress-LastFM-Aside"]="https://github.com/sankroh/Octopress-LastFM-Aside.git"
    ["PSPTool"]="https://github.com/PSPReverse/PSPTool.git"
    ["QCBOR"]="https://github.com/laurencelundblade/QCBOR.git"
    ["TrenchBoot.github.io"]="https://github.com/TrenchBoot/TrenchBoot.github.io.git"
    ["acpica"]="https://github.com/acpica/acpica.git"
    ["ansible-role-customize-gnome"]="https://github.com/PeterMosmans/ansible-role-customize-gnome.git"
    ["armbian-build"]="https://github.com/armbian/build.git"
    ["backends"]="https://gitlab.com/sane-project/backends.git"
    ["batch2bash"]="https://github.com/gajop/batch2bash.git"
    ["charra"]="https://github.com/Fraunhofer-SIT/charra.git"
    ["chirpstack-gateway-os"]="https://github.com/chirpstack/chirpstack-gateway-os.git"
    ["coreboot"]="https://review.coreboot.org/coreboot.git"
    ["cukinia"]="https://github.com/savoirfairelinux/cukinia.git"
    ["debos"]="https://github.com/go-debos/debos.git"
    ["documentation"]="https://github.com/TrenchBoot/documentation.git"
    ["ec"]="https://github.com/system76/ec.git"
    ["fiedka"]="https://github.com/fiedka/fiedka.git"
    ["flashrom"]="https://review.coreboot.org/flashrom.git"
    ["freebsd-ports"]="https://github.com/freebsd/freebsd-ports.git"
    ["freebsd-src"]="https://git.FreeBSD.org/src.git"
    ["fwupd"]="https://github.com/fwupd/fwupd.git"
    ["homepage"]="https://review.coreboot.org/homepage.git"
    ["isar"]="https://github.com/ilbers/isar.git"
    ["kas"]="https://github.com/siemens/kas.git"
    ["landing-zone"]="https://github.com/TrenchBoot/landing-zone.git"
    ["libwpe"]="https://github.com/WebPlatformForEmbedded/libwpe.git"
    ["linux"]="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
    ["meta-eid"]="https://github.com/eid-project/meta-eid.git"
    ["meta-openembedded"]="https://github.com/openembedded/meta-openembedded.git"
    ["meta-openwrt"]="https://github.com/kraj/meta-openwrt.git"
    ["meta-riscv"]="https://github.com/riscv/meta-riscv.git"
    ["meta-riscv"]="https://github.com/riscv/meta-riscv.git"
    ["meta-security"]="https://git.yoctoproject.org/meta-security"
    ["meta-sunxi"]="https://github.com/linux-sunxi/meta-sunxi.git"
    ["meta-swupdate"]="https://github.com/sbabic/meta-swupdate.git"
    ["meta-virtualization"]="git://git.yoctoproject.org/meta-virtualization"
    ["meta-webkit"]="https://github.com/Igalia/meta-webkit.git"
    ["netbsd-pkgsrc"]="https://github.com/NetBSD/pkgsrc.git"
    ["netbsd-src"]="https://github.com/NetBSD/src.git"
    ["openbsd-ports"]="https://github.com/openbsd/ports.git"
    ["openbsd-src"]="https://github.com/openbsd/src.git"
    ["poky"]="git://git.yoctoproject.org/poky"
    ["pycom-documentation"]="https://github.com/pycom/pycom-documentation.git"
    ["qubes-antievilmaid"]="https://github.com/QubesOS/qubes-antievilmaid.git"
    ["qubes-app-linux-split-gpg2"]="https://github.com/HW42/qubes-app-linux-split-gpg2.git"
    ["qubes-builder-rpm"]="https://github.com/QubesOS/qubes-builder-rpm.git"
    ["rpi-build"]="https://github.com/notro/rpi-build.git"
    ["seabios"]="https://review.coreboot.org/seabios.git"
    ["swupdate"]="https://github.com/sbabic/swupdate.git"
    ["systemd"]="https://github.com/systemd/systemd.git"
    ["trenchboot-issues"]="https://github.com/TrenchBoot/trenchboot-issues.git"
    ["u-boot"]="https://source.denx.de/u-boot/u-boot.git"
    ["xen"]="git://xenbits.xen.org/xen.git"
)

REPOS_DIR="repos"
