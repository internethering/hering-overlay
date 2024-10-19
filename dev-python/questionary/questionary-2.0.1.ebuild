# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Questionary is a Python library for effortlessly building pretty cli"
HOMEPAGE="https://pypi.org/project/questionary/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
<=dev-python/prompt-toolkit-3.0.36[${PYTHON_USEDEP}]
"
