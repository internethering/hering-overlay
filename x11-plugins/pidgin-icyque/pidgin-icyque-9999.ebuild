# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="ICQ WIM protocol for libpurple"
HOMEPAGE="https://github.com/EionRobb/icyque"
EGIT_REPO_URI="https://github.com/EionRobb/icyque"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="net-im/pidgin
	dev-libs/json-glib"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"
DOCS=( "README.md" )
