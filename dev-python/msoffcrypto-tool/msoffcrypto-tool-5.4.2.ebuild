# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python tool and library for decrypting and encrypting MS Office files using a password or other keys"
HOMEPAGE="
	https://github.com/nolze/msoffcrypto-tool
	https://pypi.org/project/msoffcrypto-tool
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/olefile[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"

PATCHES=(
        "${FILESDIR}/notice.patch"
)

python_prepare_all() {
    rm NOTICE.txt || die
    distutils-r1_python_prepare_all
}