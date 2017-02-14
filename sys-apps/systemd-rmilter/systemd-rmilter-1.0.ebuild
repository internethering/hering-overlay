# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd

DESCRIPTION="rmilter systemd service"
HOMEPAGE="https://github.com/internethering"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="mail-filter/rmilter"

src_install() {
	systemd_dounit "${FILESDIR}/rmilter.service"
	systemd_dotmpfilesd "${FILESDIR}/rmilter.tmpfiles.conf"
}
