# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cleaning /etc/portage/package.* from unused entries"
HOMEPAGE="https://wiki.gentoo.org/wiki/User:Tillschaefer/cleanup_package"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-portage/portage-utils"

src_install() {
	dosbin "${FILESDIR}/eclean-package"
}
