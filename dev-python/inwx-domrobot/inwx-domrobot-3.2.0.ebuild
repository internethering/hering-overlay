# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="INWX Domrobot Python 3 Client"
HOMEPAGE="https://github.com/inwx/python-client"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}/requirements.patch"
)
