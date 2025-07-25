# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="python tools to analyze MS OLE2 files and MS Office documents, for malware analysis, forensics and debugging"
HOMEPAGE="
	https://github.com/decalage2/oletools
	https://pypi.org/project/oletools/
"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}" .zip)"


LICENSE="All rights reserved"
SLOT="0"
KEYWORDS="~amd64"

# TODO: Find out how this is supposed to be run
RESTRICT="test"

RDEPEND="
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/olefile[${PYTHON_USEDEP}]
	dev-python/colorclass[${PYTHON_USEDEP}]
	dev-python/easygui[${PYTHON_USEDEP}]
	dev-python/msoffcrypto-tool[${PYTHON_USEDEP}]
	dev-python/pcodedmp[${PYTHON_USEDEP}]
"
BDEPEND="app-arch/unzip"

distutils_enable_tests pytest
