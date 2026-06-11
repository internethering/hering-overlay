# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( pypy3 python3_{10..15} )

inherit distutils-r1 pypi

DESCRIPTION="offers a useful way to add arbitrary, structured metadata to text documents"
HOMEPAGE="https://pypi.org/project/python-frontmatter/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/tomlkit[${PYTHON_USEDEP}]
	dev-python/pyaml[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
