# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Pickled object field for Django"
HOMEPAGE="
	https://github.com/gintas/django-picklefield
	https://pypi.org/project/django-picklefield/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# TODO: Find out how this is supposed to be run
RESTRICT="test"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
