# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qmake-utils eutils

DESCRIPTION="OwnNotes is a plain-text notepad, that (optionally) works together with the notes application of ownCloud."
HOMEPAGE="http://www.qownnotes.org/"
MY_P="b939-070648"
SRC_URI="https://github.com/pbek/QOwnNotes/archive/linux-${MY_P}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/QOwnNotes-linux-${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt5"
REQUIRED_USE="qt5"

DEPEND="qt5? (
		dev-qt/qtwidgets:5
		dev-qt/qtgui:5
		dev-qt/qtcore:5
		dev-qt/qtsql:5
		dev-qt/qtsvg:5
		dev-qt/qtnetwork:5
		dev-qt/qtscript:5
		dev-qt/qtprintsupport:5
	)"
RDEPEND="${DEPEND}"

src_prepare() {
	cd src/libraries
	rmdir qmarkdowntextedit
	git clone https://github.com/pbek/qmarkdowntextedit.git
}

src_compile() {
	cd src
	eqmake5 QOwnNotes.pro -r 
}

src_install() {
	cd src
	emake
	dobin QOwnNotes

	newicon ../icons/icon.ico QOwnNotes.ico
	newicon ../icons/icon.svg QOwnNotes.svg
	newicon ../icons/icon.png QOwnNotes.png

	make_desktop_entry /usr/bin/QOwnNotes QOwnNotes QOwnNotes Office
}
