# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python extension module for dmidecode "
HOMEPAGE="https://fedorahosted.org/python-dmidecode/"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/python-dmidecode_3.12.2.orig.tar.gz"
S="${S}/src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-apps/dmidecode"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i -e "s:src/::" setup.py
	cp ${WORKDIR}/${P}/dmidecode.py ${S}
}
