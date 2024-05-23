# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="A comprehensive, fast, pure-Python memcached client."
HOMEPAGE="https://pypi.org/project/pymemcache/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
BDEPEND=""
