# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

MY_P=${P/-/.}

DESCRIPTION="Small collection of test tool plugins"
HOMEPAGE="https://gitlab.com/warsaw/flufl.testing https://pypi.org/project/flufl.testing/"
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/nose2[${PYTHON_USEDEP}]"

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
