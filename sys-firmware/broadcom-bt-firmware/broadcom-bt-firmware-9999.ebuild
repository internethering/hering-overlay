# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Firmware for Broadcom WIDCOMM® Bluetooth devices"
HOMEPAGE="https://github.com/winterheart/broadcom-bt-firmware"
EGIT_REPO_URI="https://github.com/winterheart/broadcom-bt-firmware.git"

LICENSE="BROADCOM-EULA"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND=""

src_install()
{
	insinto lib/firmware
	doins -r brcm

	newdoc LICENSE.broadcom_bcm20702 LICENSE
	dodoc DEVICES.md
	dodoc README.md
}
