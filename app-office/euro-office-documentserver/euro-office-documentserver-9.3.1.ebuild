# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Euro-Office DocumentServer"
HOMEPAGE="https://github.com/Euro-Office/DocumentServer"
SRC_URI="https://github.com/Euro-Office/DocumentServer/releases/download/v${PV}/${PN}_${PV}-dev.1_amd64.deb"

S="${WORKDIR}"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	unpack_deb ${A}
}

src_install(){
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/etc" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/var" "${D}" || die "install failed!"
}
