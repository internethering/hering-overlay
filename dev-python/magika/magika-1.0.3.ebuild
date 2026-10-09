# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( pypy3 python3_{8..15} )
inherit distutils-r1 pypi

DESCRIPTION="Fast and accurate AI powered file content types detection"
HOMEPAGE="https://securityresearch.google/magika"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""

distutils_enable_tests pytest