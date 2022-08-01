# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cleaning /etc/portage/package.* from unused entries"
HOMEPAGE="https://wiki.gentoo.org/wiki/User:Tillschaefer/cleanup_package"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-portage/portage-utils"

# Need to set S due to PMS saying we need it existing, but no SRC_URI
S=${WORKDIR}

src_install() {
	dosbin "${FILESDIR}/eclean-package"
}