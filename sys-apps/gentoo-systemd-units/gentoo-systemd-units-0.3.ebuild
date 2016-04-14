# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd

DESCRIPTION="some usefull units for systemd on gentoo based systems"
HOMEPAGE="https://github.com/internethering/gentoo-systemd-units"
SRC_URI="https://github.com/internethering/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-apps/systemd"
RDEPEND="${DEPEND}"

src_install() {
	for i in *.timer ; do
		systemd_dounit $i
	done
	for i in *.service ; do
		systemd_dounit $i
	done
}
