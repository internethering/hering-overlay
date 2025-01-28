# Copyright 1999-2025 Gentoo Users
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit desktop xdg-utils

MY_PV=$(ver_rs 3 .v)
MY_PN="${PN}"
MY_PKGM=17

DESCRIPTION="Apache Directory Studio is an universal LDAP directory tool."
HOMEPAGE="http://directory.apache.org/studio/"
SRC_URI="https://archive.apache.org/dist/directory/studio/${MY_PV}-M${MY_PKGM}/${MY_PN}-${MY_PV}-M${MY_PKGM}-linux.gtk.x86_64.tar.gz"

S="${WORKDIR}/${MY_PN}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="|| ( >=virtual/jre-1.8 >=virtual/jdk-1.8 )
	x11-libs/gtk+:2
	app-crypt/libsecret"

MY_ARCH="amd64"
INSTALL_DIR="/opt/${PN}"

src_install() {
	newicon "features/org.apache.directory.studio.schemaeditor.feature_${MY_PV}-M${MY_PKGM}/studio.png" "${MY_PN}.png"

	make_desktop_entry "${MY_PN}" "Apache Directory Studio" "${MY_PN}" "System"

	insinto "${INSTALL_DIR}"
	doins -r *

	fperms +x "${INSTALL_DIR}/${MY_PN}"

	dosym "${INSTALL_DIR}/${MY_PN}" "/usr/bin/${MY_PN}"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
