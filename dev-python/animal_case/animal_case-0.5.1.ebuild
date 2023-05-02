# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{9..11} )
inherit distutils-r1

DESCRIPTION="The author of this package has not provided a project description"
HOMEPAGE="https://pypi.org/project/animal-case/"
SRC_URI="mirror://pypi/${PN:0:1}"/${PN}/${P}.tar.gz

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""
BDEPEND=""
