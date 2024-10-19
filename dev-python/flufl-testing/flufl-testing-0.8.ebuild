# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
PYPI_PN=${PN/-/.}
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="Small collection of test tool plugins"
HOMEPAGE="https://gitlab.com/warsaw/flufl.testing https://pypi.org/project/flufl.testing/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/nose2[${PYTHON_USEDEP}]"

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
