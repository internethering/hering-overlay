# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=poetry ##git
DISTUTILS_USE_PEP517=setuptools #pypi
PYTHON_COMPAT=( python3_{8..13} )
inherit distutils-r1 pypi

DESCRIPTION="Markdown to PDF conversion tool"
HOMEPAGE="https://pypi.org/project/md2pdf/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/weasyprint[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/pymdown-extensions[${PYTHON_USEDEP}]
	dev-python/markdown2[${PYTHON_USEDEP}]
	dev-python/python-frontmatter[${PYTHON_USEDEP}]"

src_prepare() {
	rm -rf tests
	distutils-r1_src_prepare
}
