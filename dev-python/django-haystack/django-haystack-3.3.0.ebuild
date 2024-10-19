# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="Pluggable search for Django"
HOMEPAGE="https://haystacksearch.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/django-2.2[${PYTHON_USEDEP}]"

# tests have too many dependencies to maintain
RESTRICT="test"

distutils_enable_sphinx docs --no-autodoc
