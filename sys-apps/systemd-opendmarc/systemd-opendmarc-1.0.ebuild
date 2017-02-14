# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd

DESCRIPTION="opendmarc systemd service"
HOMEPAGE="https://github.com/internethering"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="mail-filter/opendmarc"

src_install() {
	systemd_dounit "${FILESDIR}/opendmarc.service"
	systemd_dotmpfilesd "${FILESDIR}/opendmarc.tmpfiles.conf"
}
