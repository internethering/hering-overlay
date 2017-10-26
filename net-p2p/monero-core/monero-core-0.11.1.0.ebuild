# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit eutils

DESCRIPTION="Monero Gui: the secure, private, untraceable cryptocurrency"
HOMEPAGE="https://getmonero.org/"

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/monero-project/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/monero-project/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz
	https://github.com/monero-project/monero/archive/v${PV}.tar.gz -> monero-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Monero"
SLOT="0"
DOCS=""
IUSE="qrcode daemon upnp unwind ldns lzma expat"

DEPEND="!daemon? ( net-p2p/monero )
	daemon? ( !net-p2p/monero )
	dev-libs/boost
	dev-libs/openssl:0
	net-dns/unbound
	sys-libs/libunwind
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtgraphicaleffects:5
	qrcode? (
		dev-qt/qtmultimedia:5[qml]
		media-gfx/zbar
	)
	upnp? ( net-libs/miniupnpc:0/16 )
	unwind? ( sys-libs/libunwind )
	ldns? ( net-libs/ldns )
	lzma? ( app-arch/xz-utils )
	expat? ( dev-libs/expat )"

RDEPEND="${DEPEND}"

BUILD_DIR="${S}/build/release"

src_unpack() {
	if [[ "${PV}" = "9999" ]]; then
		git-r3_src_unpack
	else
		unpack ${A}
		rmdir "${WORKDIR}/${P}/monero"
		mv "${WORKDIR}/monero-${PV}" "${WORKDIR}/${P}/monero"
	fi
}

src_compile() {
	QT_SELECT=5 ./build.sh
}

src_install() {
	dobin "${BUILD_DIR}/bin/monero-wallet-gui"
	use daemon && dobin "${BUILD_DIR}/bin/monerod"

	insinto "usr/share/${PN}/translations"
	for lang in ${BUILD_DIR}/bin/translations/*
	do
		doins "${lang}"
	done

	for icon in images/appicons/* ; do
		filename=${icon##*/}
		newicon -s ${filename/.png} ${icon} monero-wallet-gui.png
	done
	make_desktop_entry "monero-wallet-gui %u" "Monero Wallet" "monero-wallet-gui" "Network;P2P;Office;Finance;" "MimeType=x-scheme-handler/monero;\nTerminal=false"
}
