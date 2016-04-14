# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils

DESCRIPTION="Advanced UrbanTerror launcher program"
HOMEPAGE="http://code.google.com/p/urtconnector/"
SRC_URI="http://urtconnector.googlecode.com/files/${P}.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND="dev-qt/qtgui:4
games-util/qstat
dev-libs/boost
dev-db/sqlite:3"

DEPEND="${RDEPEND}"