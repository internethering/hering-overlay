# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..15} )
inherit distutils-r1

DESCRIPTION="Awesome OCR Library"
HOMEPAGE="https://github.com/rapidai/rapidocr"
SRC_URI="https://github.com/RapidAI/RapidOCR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}/python"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="opencv"

RDEPEND="
	opencv? ( media-libs/opencv[python,${PYTHON_USEDEP}] )
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

src_unpack() {
	default
	mv "${WORKDIR}/RapidOCR-${PV}" "${WORKDIR}/${P}"
}

distutils_enable_tests pytest