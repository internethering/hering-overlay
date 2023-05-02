# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

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
