# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="A multiprocessing distributed task queue for Django"
HOMEPAGE="https://django-q.readthedocs.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/django[${PYTHON_USEDEP}]
	dev-python/arrow[${PYTHON_USEDEP}]
	dev-python/asgiref[${PYTHON_USEDEP}]
	dev-python/blessed[${PYTHON_USEDEP}]
	dev-python/django-picklefield[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/sqlparse[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]"

DOCS=( README.rst )
