# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="Verify that currently installed version is the latest one released on PyPI"
HOMEPAGE="https://pypi.org/project/pypi-latest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/questionary[${PYTHON_USEDEP}]"
