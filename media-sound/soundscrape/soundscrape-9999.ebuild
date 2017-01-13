# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 )

inherit distutils-r1 git-r3

DESCRIPTION="SoundScrape makes it easy to download from SoundCloud, Bandcamp and MixCloud"
HOMEPAGE="https://github.com/Miserlou/SoundScrape"
EGIT_REPO_URI="https://github.com/Miserlou/SoundScrape.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
dev-python/docopt
media-libs/mutagen
dev-python/termcolor
dev-python/requests
dev-python/clint
dev-python/simplejson
dev-python/wheel
dev-python/demjson
dev-python/fudge
dev-python/nose
dev-python/soundcloud
"
