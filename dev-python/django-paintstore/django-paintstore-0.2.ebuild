# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=true
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="a Django app that integrates jQuery ColorPicker with the Django admin"
HOMEPAGE="https://github.com/gsiegman/django-paintstore"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/django[${PYTHON_USEDEP}]"
