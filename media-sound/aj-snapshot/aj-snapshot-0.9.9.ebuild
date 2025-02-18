# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="Tool for storing/restoring JACK and/or ALSA connections to/from cml files."
HOMEPAGE="https://sourceforge.net/projects/aj-snapshot/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="dev-libs/mxml:0
	media-libs/alsa-lib
	virtual/jack"
RDEPEND="$DEPEND"

pkg_setup() {
	append-ldflags $(no-as-needed)
}
