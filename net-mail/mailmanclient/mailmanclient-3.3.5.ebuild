# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the GNU Mailman 3 REST API"
HOMEPAGE="https://www.list.org"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-services[${PYTHON_USEDEP}]
		net-mail/mailman[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst )

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Needs network
	src/mailmanclient/tests/test_client.py::TestFindUsers::test_find_user_page
	src/mailmanclient/tests/test_client.py::TestFindUsers::test_find_users
)

src_prepare() {
	sed -e '/addopts/d' -i pytest.ini || die
	distutils-r1_src_prepare
}
