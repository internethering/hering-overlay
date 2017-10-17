# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

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

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
	systemd_dounit "${FILESDIR}/rmilter.service"
	systemd_dotmpfilesd "${FILESDIR}/rmilter.tmpfiles.conf"
}
