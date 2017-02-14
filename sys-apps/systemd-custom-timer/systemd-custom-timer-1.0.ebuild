# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd

DESCRIPTION="some custom timer units for systemd on gentoo based systems"
HOMEPAGE="https://github.com/internethering"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="spamassassin geoip clamav-unofficial-sigs dhparams"

DEPEND=""
RDEPEND="spamassassin? ( mail-filter/spamassassin )
geoip? ( dev-libs/geoip )
clamav-unofficial-sigs? ( app-antivirus/clamav-unofficial-sigs )"

src_install() {
	if use spamassassin ; then
		systemd_dounit "${FILESDIR}/sa-update.timer"
		systemd_dounit "${FILESDIR}/sa-update.service"
	fi
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