# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="A high level API for Python internationalization"
HOMEPAGE="https://gitlab.com/warsaw/flufl.i18n"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/atpublic[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/sybil[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

src_prepare() {
	sed -e '/addopts/d' -i pyproject.toml || die
	distutils-r1_src_prepare
}
