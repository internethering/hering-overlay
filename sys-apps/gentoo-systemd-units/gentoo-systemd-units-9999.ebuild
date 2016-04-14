# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd git-r3

DESCRIPTION="some usefull units for systemd on gentoo based systems"
HOMEPAGE="https://github.com/internethering/gentoo-systemd-units"
EGIT_REPO_URI="git://github.com/internethering/gentoo-systemd-units.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	for i in *.timer ; do
		systemd_dounit $i
	done
	for i in *.service ; do
		systemd_dounit $i
	done
}
