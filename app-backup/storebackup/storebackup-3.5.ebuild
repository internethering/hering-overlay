# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="free, super efficient backup software"
HOMEPAGE="http://storebackup.org/"
MY_PN="storeBackup"
MY_P="${MY_PN}-${PV}"
SRC_URI="http://download.savannah.gnu.org/releases/${PN}/${MY_P}.tar.bz2"
S="${WORKDIR}/${MY_PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dosym storeBackup.pl usr/bin/storeBackup
	dobin bin/*
	exeinto /usr/lib/
	doexe lib/*
	doman man/man1/*
	dodoc doc/*
	dodir etc/storebackup.d
	exeinto /etc/cron.daily/
	doexe cron-storebackup
}
