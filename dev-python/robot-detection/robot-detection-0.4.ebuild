# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )

inherit distutils-r1 pypi

DESCRIPTION="Module to detect if a given HTTP User Agent is a web crawler"
HOMEPAGE="https://github.com/rory/robot-detection"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"

distutils_enable_tests unittest
