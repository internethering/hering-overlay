# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="terminal for the Nemo file manager"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/2.4.x.tar.gz"
S="${WORKDIR}/nemo-extensions-2.4.x/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=gnome-extra/nemo-python-2.4.0"
RDEPEND="${DEPEND} \
	x11-libs/vte:2.90 \
	dev-python/pyxdg[${PYTHON_USEDEP}]"

src_install() {
	default
	python_fix_shebang src/
	exeinto usr/share/nemo-python/extensions/
	doexe src/nemo_terminal.py

	insinto usr/share/glib-2.0/schemas
	doins src/org.nemo.extensions.nemo-terminal.gschema.xml

	insinto usr/share/nemo-terminal
	doins pixmap/logo_120x120.png
}
