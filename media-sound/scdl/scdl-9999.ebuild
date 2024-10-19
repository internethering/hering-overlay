# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )

inherit distutils-r1 git-r3

DESCRIPTION="Soundcloud Music Downloader"
HOMEPAGE="https://github.com/flyingrub/scdl"
EGIT_REPO_URI="https://github.com/flyingrub/scdl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
dev-python/docopt
media-libs/mutagen
dev-python/termcolor
dev-python/requests
dev-python/clint
"

PATCHES=(
	"${FILESDIR}/stray.patch"
)
