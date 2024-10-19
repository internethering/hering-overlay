# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="pure-ftpd systemd service"
HOMEPAGE="https://github.com/internethering"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="net-ftp/pure-ftpd"

src_install() {
	systemd_dounit "${FILESDIR}/pure-ftpd.service"
}
