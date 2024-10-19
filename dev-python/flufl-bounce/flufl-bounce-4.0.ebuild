# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
PYPI_PN=${PN/-/.}
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="Email bounce detectors"
HOMEPAGE="https://gitlab.com/warsaw/flufl.bounce"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/atpublic[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
