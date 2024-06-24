# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Questionary is a Python library for effortlessly building pretty cli"
HOMEPAGE="https://pypi.org/project/questionary/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
<=dev-python/prompt-toolkit-3.0.36[${PYTHON_USEDEP}]
"
