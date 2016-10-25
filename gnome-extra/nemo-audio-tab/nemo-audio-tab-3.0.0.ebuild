# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="View audio tag information from the file manager's properties tab"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=">=gnome-extra/nemo-python-${PV}
	media-libs/mutagen[${PYTHON_USEDEP}]"

src_install() {
	default
	python_fix_shebang .
	exeinto usr/share/nemo-python/extensions/
	doexe nemo-extension/nemo-audio-tab.py
	insinto usr/share/nemo-python/extensions/
	doins nemo-extension/nemo-audio-tab.glade
}