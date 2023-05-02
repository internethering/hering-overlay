# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Python bindings to GitHub's cmark"
HOMEPAGE="https://pypi.org/project/cmarkgfm/"
SRC_URI="mirror://pypi/${PN:0:1}"/${PN}/${P}.tar.gz

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=""
BDEPEND=""
