# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Verify that currently installed version is the latest one released on PyPI"
HOMEPAGE="https://pypi.org/project/pypi-latest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
dev-python/click[${PYTHON_USEDEP}]
dev-python/rich[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/questionary[${PYTHON_USEDEP}]
"
