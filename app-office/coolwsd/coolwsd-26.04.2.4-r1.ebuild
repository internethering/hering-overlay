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
LANGUAGES=( bg ca cs cy da de el en-gb en-us eo es eu fi fr ga gl he hr hu hy id is it ja kk
ko lo nb nl oc pl pt-br pt ro ru sk sl sq sv tr uk vi zh-cn zh-tw )

for LANG in ${LANGUAGES[@]}; do
	IUSE+=" l10n_${LANG}"
	PDEPEND+=" l10n_${LANG}? ( app-office/collaboraofficebasis-${LANG} )"
done
unset LANG LANGUAGES

DEPEND="
	acct-group/cool
	acct-user/cool
	app-office/collaboraofficebasis-draw
	app-office/collaboraofficebasis-impress
	app-office/collaboraoffice
	app-office/collaboraofficebasis-math
	app-office/collaboraofficebasis-calc
	app-office/collaboraofficebasis-extension-pdf-import
	app-office/collaboraofficebasis-ooofonts
	app-office/collaboraofficebasis-core
	app-office/collaboraofficebasis-graphicfilter
	app-office/collaboraofficebasis-writer
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
