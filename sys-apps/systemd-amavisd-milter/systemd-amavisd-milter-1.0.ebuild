# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Amavisd-milter systemd service"
HOMEPAGE="https://github.com/internethering"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"

RDEPEND="mail-filter/amavisd-milter"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
	systemd_dounit "${FILESDIR}/amavisd-milter.service"
}
