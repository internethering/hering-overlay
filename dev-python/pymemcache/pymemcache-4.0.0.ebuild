# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )
inherit distutils-r1 pypi

DESCRIPTION="A comprehensive, fast, pure-Python memcached client."
HOMEPAGE="https://pypi.org/project/pymemcache/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
