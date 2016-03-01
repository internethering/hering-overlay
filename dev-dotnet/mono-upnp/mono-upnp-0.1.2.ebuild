# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit mono-env autotools eutils

DESCRIPTION="UPNP C# binding"
HOMEPAGE="https://github.com/mono/mono-upnp"
SRC_URI="https://github.com/mono/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/mono"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/disable-nunit.patch"

	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}

src_compile() {
	emake MCS=/usr/bin/dmcs
}
