# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="A multiprocessing distributed task queue for Django"
HOMEPAGE="https://django-q.readthedocs.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/django[${PYTHON_USEDEP}]
	dev-python/django-picklefield[${PYTHON_USEDEP}]
	dev-python/blessed[${PYTHON_USEDEP}]
	dev-python/arrow[${PYTHON_USEDEP}]"

DOCS=( README.rst )
