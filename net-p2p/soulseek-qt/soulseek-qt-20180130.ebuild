# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit desktop

DESCRIPTION="Official binary Qt SoulSeek client"
HOMEPAGE="http://www.soulseekqt.net/"
BINARY_NAME="SoulseekQt-${PV:0:4}-$((${PV:4:2}))-$((${PV:6:2}))"
SRC_URI="https://www.slsknet.org/SoulseekQt/Linux/${BINARY_NAME}-64bit-appimage.tgz"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="media-libs/libpng x11-libs/libX11 x11-libs/libxcb media-libs/freetype x11-libs/libXau x11-libs/libXdmcp dev-libs/libbsd dev-libs/expat"

S="${WORKDIR}"

RESTRICT="mirror"

QA_PREBUILT="opt/bin/.*"

src_install() {
	use amd64 && BINARY_NAME="${BINARY_NAME}-64bit"
	into /opt
	newbin "${BINARY_NAME}".AppImage "${PN}"
	doicon "${FILESDIR}/soulseek-qt.png"
	make_desktop_entry "/opt/bin/soulseek-qt %u" "Soulseek" "soulseek-qt" "Network;P2P;" "Terminal=false"
}
