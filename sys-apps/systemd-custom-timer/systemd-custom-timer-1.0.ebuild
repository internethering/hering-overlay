# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit systemd

DESCRIPTION="some custom timer units for systemd on gentoo based systems"
HOMEPAGE="https://github.com/internethering"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="geoip clamav-unofficial-sigs dhparams"

DEPEND=""
RDEPEND="geoip? ( dev-libs/geoip )
clamav-unofficial-sigs? ( app-antivirus/clamav-unofficial-sigs )"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
	if use geoip ; then
		systemd_dounit "${FILESDIR}/geoipupdate.timer"
		systemd_dounit "${FILESDIR}/geoipupdate.service"
	fi
	if use clamav-unofficial-sigs ; then
		systemd_dounit "${FILESDIR}/clamav-unofficial-sigs.service"
		systemd_dounit "${FILESDIR}/clamav-unofficial-sigs.timer"
	fi
	if use dhparams ; then
		systemd_newunit "${FILESDIR}/dhparams-update.service" "dhparams-update@.service"
		systemd_newunit "${FILESDIR}/dhparams-update.timer" "dhparams-update@.timer"
	fi
	systemd_dounit "${FILESDIR}/start-failed.service"
	systemd_dounit "${FILESDIR}/start-failed.timer"
}