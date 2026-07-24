# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

MY_PVR=$(ver_cut 1-3 ${PVR})-$(ver_cut 5 ${PVR})

DESCRIPTION="Images module for Collabora Office"
HOMEPAGE="https://www.collaboraoffice.com"
SRC_URI="https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-deb/${PN}_${MY_PVR}_amd64.deb"

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

src_install() {
	cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
}
