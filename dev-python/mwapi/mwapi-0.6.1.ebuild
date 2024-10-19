# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="very simple convenience wrapper around the MediaWiki API"
HOMEPAGE="https://pypi.org/project/mwapi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"
