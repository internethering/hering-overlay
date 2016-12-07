# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils gnome2

DESCRIPTION="nemo extension for computing checksums and more using gtkhash"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc mhash nss nettle gcrypt"

RDEPEND="gnome-base/gnome-common
	dev-libs/libgcrypt:0/20"
DEPEND=">=gnome-extra/nemo-${PV}[introspection]
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
