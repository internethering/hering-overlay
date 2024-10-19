# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="A supersonic micro-framework for building cloud APIs"
HOMEPAGE="https://falconframework.org/"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

src_configure() {
	rm -rf examples
	rm -rf tests
	rm -rf e2e-tests
	rm -rf tools
	rm -rf docs
	rm -rf requirements
}
