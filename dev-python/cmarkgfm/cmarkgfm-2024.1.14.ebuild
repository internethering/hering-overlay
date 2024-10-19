# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )

inherit distutils-r1 pypi

DESCRIPTION="Python bindings to GitHub's cmark"
HOMEPAGE="https://pypi.org/project/cmarkgfm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"
