# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd git-r3

DESCRIPTION="some usefull units for systemd on gentoo based systems"
HOMEPAGE="https://github.com/internethering/gentoo-systemd-units"
EGIT_REPO_URI="git://github.com/internethering/gentoo-systemd-units.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="opendmarc pure-ftpd spamassassin geoip clamav-unofficial-sigs amavisd-milter dhparams"

DEPEND=""
RDEPEND="opendmarc? ( mail-filter/opendmarc )
pure-ftpd? ( net-ftp/pure-ftpd )
spamassassin? ( mail-filter/spamassassin )
geoip? ( dev-libs/geoip )
clamav-unofficial-sigs? ( app-antivirus/clamav-unofficial-sigs )
amavisd-milter? ( mail-filter/amavisd-milter )"

src_install() {
	if use opendmarc ; then
		systemd_dounit opendmarc.service
		systemd_dotmpfilesd opendmarc.tmpfiles.conf
	fi
	if use pure-ftpd ; then
		systemd_dounit pure-ftpd.service
	fi
	if use spamassassin ; then
		systemd_dounit sa-update.timer
		systemd_dounit sa-update.service
	fi
	if use geoip ; then
		systemd_dounit geoipupdate.timer
		systemd_dounit geoipupdate.service
	fi
	if use clamav ; then
		systemd_dounit clamav-unofficial-sigs.service
		systemd_dounit clamav-unofficial-sigs.timer
	fi
	if use amavisd-milter ; then
		systemd_dounit amavisd-milter.service
	fi
	if use dhparams ; then
		systemd_dounit dhparams-update@.service
		systemd_dounit dhparams-update@.timer
	fi
	systemd_dounit start-failed.service
	systemd_dounit start-failed.timer
}