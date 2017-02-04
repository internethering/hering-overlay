# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils

DESCRIPTION="Advanced UrbanTerror launcher program"
HOMEPAGE="http://code.google.com/p/urtconnector/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/urtconnector/${P}.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-qt/qtgui:4
games-util/qstat
>=dev-libs/boost-1.59.0
dev-db/sqlite:3"

DEPEND="${RDEPEND}"

PATCHES=(
"${FILESDIR}"/urbanterror43.patch
"${FILESDIR}"/std11.patch
)
