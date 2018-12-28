# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 python3_7 )

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
