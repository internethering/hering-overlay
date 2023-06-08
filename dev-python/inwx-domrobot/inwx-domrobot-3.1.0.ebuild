# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="INWX Domrobot Python 3 Client"
HOMEPAGE="https://github.com/inwx/python-client"
SRC_URI="https://github.com/inwx/python-client/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/python-client-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
