# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1
#inherit python
MY_P="UrTSB-${PV}"

DESCRIPTION="a Game Server Browser for the FPS Urban Terror"
HOMEPAGE="https://code.google.com/p/urtsb/"
SRC_URI="https://urtsb.googlecode.com/files/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/pygtk"
RDEPEND="${DEPEND}"

#src_prepare() {
#    python_convert_shebangs -r 2 .
#}
#
#pkg_setup() {
##	python_set_active_version 2
#	python_pkg_setup
#}
