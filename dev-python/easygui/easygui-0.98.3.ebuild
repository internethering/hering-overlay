# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="EasyGUI is a module for very simple, very easy GUI programming in Python."
HOMEPAGE="
	https://github.com/robertlugg/easygui
	https://pypi.org/project/easygui
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""