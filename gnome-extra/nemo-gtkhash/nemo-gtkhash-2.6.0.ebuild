# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils

DESCRIPTION="hashing into Nemo file manager"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/2.4.x.tar.gz"
S="${WORKDIR}/nemo-extensions-2.4.x/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc mhash nss nettle gcrypt"

RDEPEND="
	net-fs/samba
	>=gnome-extra/nemo-2.4.0[introspection]
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.9
	virtual/pkgconfig
	doc? (
		app-text/docbook-xml-dtd:4.1.2
		dev-libs/libxslt
		>=dev-util/gtk-doc-1.9 )
	mhash? ( app-crypt/mhash )
	nss? ( dev-libs/nss )
	nettle? ( dev-libs/nettle )
	gcrypt? ( dev-libs/libgcrypt )
"
src_prepare() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}

src_configure() {
	econf --enable-nemo --enable-libcrypto --enable-linux-crypto \
		$(use_enable mhash ) \
		$(use_enable nss ) \
		$(use_enable nettle ) \
		$(use_enable gcrypt ) 
}
