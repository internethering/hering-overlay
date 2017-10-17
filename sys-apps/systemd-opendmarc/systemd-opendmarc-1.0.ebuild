# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

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

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
	systemd_dounit "${FILESDIR}/opendmarc.service"
	systemd_dotmpfilesd "${FILESDIR}/opendmarc.tmpfiles.conf"
}
