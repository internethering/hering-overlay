# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="integrate preview Nemo file manager"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/2.4.x.tar.gz"
S="${WORKDIR}/nemo-extensions-2.4.x/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

RDEPEND="
	>=gnome-extra/nemo-2.4.0[introspection]
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.9
	virtual/pkgconfig
	media-libs/gstreamer:1.0
	app-text/evince
	net-libs/webkit-gtk:3
	media-libs/musicbrainz:5
	doc? (
		app-text/docbook-xml-dtd:4.1.2
		dev-libs/libxslt
		>=dev-util/gtk-doc-1.9 )
"
src_prepare() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}
