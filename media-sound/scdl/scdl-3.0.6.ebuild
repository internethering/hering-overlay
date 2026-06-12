# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( pypy3 python3_{10..14} python3_{13..14}t )

inherit distutils-r1 pypi

DESCRIPTION="Soundcloud Music Downloader"
HOMEPAGE="https://github.com/flyingrub/scdl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/docopt-ng[${PYTHON_USEDEP}]
	dev-python/soundcloud-v2[${PYTHON_USEDEP}]
	net-misc/yt-dlp[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
	media-video/ffmpeg"

python_compile() {
	python_domodule scdl scdl.egg-info
}

python_install() {
	distutils-r1_python_install
	python_optimize
	dobin "${FILESDIR}/scdl"
}
