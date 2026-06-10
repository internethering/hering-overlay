# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Official binary Qt SoulSeek client"
HOMEPAGE="https://www.slsknet.org"
BINARY_NAME="SoulseekQt-${PV:0:4}-$((${PV:4:2}))-$((${PV:6:2}))"
SRC_URI="https://github.com/M0Rf30/soulseekqt-binaries/releases/download/20240630/${BINARY_NAME}-64bit.AppImage.tgz https://github.com/M0Rf30/soulseekqt-binaries/blob/main/desktop/soulseekqt.png"

S="${WORKDIR}"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-libs/libpng x11-libs/libX11 x11-libs/libxcb media-libs/freetype x11-libs/libXau x11-libs/libXdmcp dev-libs/libbsd dev-libs/expat sys-libs/libselinux"

RESTRICT="mirror"

QA_PREBUILT="opt/bin/.*"

src_unpack() {
	unpack ${BINARY_NAME}-64bit.AppImage.tgz
}

src_install() {
	use amd64 && BINARY_NAME="${BINARY_NAME}-64bit"
	into /opt
	newbin "${BINARY_NAME}".AppImage "${PN}"
	doicon "${DISTDIR}/soulseekqt.png"
	make_desktop_entry "/opt/bin/soulseek-qt" "Soulseek" "soulseekqt" "Network;FileTransfer;"
}
