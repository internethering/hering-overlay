# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

MY_PN=${PN/-/.}

DESCRIPTION="Easily write objects that delegate behavior"
HOMEPAGE="https://code.launchpad.net/lazr.delegates"
SRC_URI="$(pypi_sdist_url --no-normalize "${MY_PN}" "${PV}")"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/zope-interface[${PYTHON_USEDEP}]
	!dev-python/namespace-lazr
"

distutils_enable_tests pytest

src_prepare() {
	# strip unused rdeps
	sed -i -e "/'setuptools'/d" -e "/'nose'/d" setup.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}
