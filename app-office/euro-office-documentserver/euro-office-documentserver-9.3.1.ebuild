# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Euro-Office DocumentServer"
HOMEPAGE="https://github.com/Euro-Office/DocumentServer"
SRC_URI="https://github.com/Euro-Office/DocumentServer/releases/download/v${PV}/${PN}_${PV}-0_amd64.deb"
#SRC_URI="https://github.com/Euro-Office/DocumentServer/releases/download/v${PV}/${PN}_9.3.1-dev.1_amd64.deb"

S="${WORKDIR}"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-group/ds
	acct-user/ds
	app-admin/supervisor
	dev-db/postgresql
	dev-db/redis
	media-fonts/corefonts
	net-misc/rabbitmq-server
	virtual/httpd-basic
"
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

pkg_postinst() {
	ewarn "there is no official documentation how to setup DocumentServer without docker"
	ewarn "see https://github.com/Euro-Office/DocumentServer/issues/229"
	ewarn "have fun to find out yourself ;)"
	ewarn "maybe https://euro-office.github.io/documentation/installation/debian/ can help"
}
