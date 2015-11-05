# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 vala

DESCRIPTION="a highly customizable chameleon theme for Gnome Shell"
HOMEPAGE="https://github.com/satya164/elegance-colors"
EGIT_REPO_URI="https://github.com/satya164/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	$(vala_depend)"

src_prepare() {
	vala_src_prepare
	sed -i -e "s/CC/VALAC/" Makefile
}

src_compile() {
	emake VALAC=${VALAC}
}
