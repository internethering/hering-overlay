# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="a GUI toolkit with a strict split between UI design declarations and programming logic"
HOMEPAGE="https://testbit.eu/wiki/Rapicorn_Org"
SRC_URI="https://testbit.eu/pub/dists/${PN}/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
KEYWORDS="~amd64 ~ppc ~x86"
SLOT="0"
IUSE=""

DEPEND="x11-libs/cairo
	x11-libs/pango
	dev-util/intltool
	dev-lang/python:2.7
	dev-libs/libxml2
	x11-libs/gdk-pixbuf
	sys-libs/readline
	media-libs/libpng:1.2"
RDEPEND="${DEPEND}"
