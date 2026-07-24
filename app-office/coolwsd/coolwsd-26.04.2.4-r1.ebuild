# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

MY_PVR=$(ver_cut 1-4 ${PVR})-$(ver_cut 6 ${PVR})

DESCRIPTION="Collabora Online WebSocket Daemon"
HOMEPAGE="https://www.collaboraoffice.com"
SRC_URI="https://www.collaboraoffice.com/repos/CollaboraOnline/CODE-deb/${PN}_${MY_PVR}_amd64.deb"

S="${WORKDIR}"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-group/cool
	acct-user/cool
	app-office/collaboraofficebasis-draw
	app-office/collaboraofficebasis-impress
	app-office/collaboraoffice
	app-office/collaboraofficebasis-en-us
	app-office/collaboraofficebasis-math
	app-office/collaboraofficebasis-calc
	app-office/collaboraofficebasis-extension-pdf-import
	app-office/collaboraofficebasis-ooofonts
	app-office/collaboraofficebasis-core
	app-office/collaboraofficebasis-graphicfilter
	app-office/collaboraofficebasis-writer
	app-office/collaboraofficebasis-de
	app-office/collaboraofficebasis-images
	app-office/collaboraoffice-ure
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	unpack_deb ${A}
}

src_install() {
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/lib" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
