# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="A web user interface for GNU Mailman 3"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/readme-renderer[${PYTHON_USEDEP}]
	dev-python/django-mailman3[${PYTHON_USEDEP}]
	net-mail/mailmanclient[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/vcrpy[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/pytest-django[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		net-mail/mailman[${PYTHON_USEDEP}]
	)
"

DOCS=( README.rst )

distutils_enable_tests pytest

src_prepare() {
	sed -e 's/test_list_info/_&/' -i src/postorius/tests/mailman_api_tests/test_list_summary.py || die
	distutils-r1_src_prepare
}

python_test() {
	local -x PYTHONPATH="${S}/src"
	cd example_project || die
	epytest ../src
}
