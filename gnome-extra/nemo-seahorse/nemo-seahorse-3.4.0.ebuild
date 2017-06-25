# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils gnome2

DESCRIPTION="seahorse plugins and utilities for encryption"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="app-crypt/seahorse
	dev-libs/dbus-glib
	dev-libs/glib:2
	x11-libs/libcryptui
	app-crypt/gcr
	x11-libs/libnotify
	gnome-base/gnome-keyring
	app-crypt/gpgme
	<app-crypt/gnupg-2.1
	>=gnome-extra/nemo-${PV}[introspection]
	x11-libs/libcryptui"

src_prepare() {
	if [[ ! -e configure ]] ; then
		./autogen.sh || die
	fi
}
