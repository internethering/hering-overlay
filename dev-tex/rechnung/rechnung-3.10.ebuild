# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit latex-package

MY_PV="310"

DESCRIPTION="LaTeX module to create invoices"
HOMEPAGE="http://www.forwiss.uni-passau.de/~berberic/TeX/Rechnung/index.html"
SRC_URI="http://www.forwiss.uni-passau.de/~berberic/TeX/Rechnung/${PN}${MY_PV}.tar.gz"

S="${WORKDIR}"/${PN}${MY_PV}

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm "${S}/rechnung.sty"
	default
}
