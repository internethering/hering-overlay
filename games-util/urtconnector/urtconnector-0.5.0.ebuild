# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games cmake-utils

DESCRIPTION="Advanced UrbanTerror launcher program"
HOMEPAGE="http://code.google.com/p/urtconnector/"
SRC_URI="http://urtconnector.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL"
KEYWORDS="x86 amd64"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/qt-gui:4
    games-util/qstat
    dev-libs/boost"

DEPEND="${RDEPEND}"



