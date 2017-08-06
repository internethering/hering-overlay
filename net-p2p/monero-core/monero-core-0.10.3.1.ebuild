# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit eutils

DESCRIPTION="This is the GUI for the core Monero implementation."
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
MY_L10N="l10n_ar l10n_de l10n_eo l10n_es l10n_fi l10n_fr l10n_hi l10n_hr l10n_id l10n_it l10n_ja l10n_nl l10n_pl l10n_pt-BR l10n_ru l10n_zh-TW l10n_zh-CN"
IUSE="qrcode ${MY_L10N}"

DEPEND="net-p2p/monero
net-dns/unbound
dev-qt/qtcore:5
dev-qt/qtdeclarative:5
dev-qt/qtquickcontrols:5
dev-qt/qtquickcontrols2:5
dev-qt/qtgraphicaleffects:5
qrcode? (
	dev-qt/qtmultimedia:5[qml]
	media-gfx/zbar
)"

RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	rmdir "${WORKDIR}/${P}/monero"
	mv "${WORKDIR}/monero-${PV}" "${WORKDIR}/${P}/monero"
}

src_compile() {
	QT_SELECT=5 ./build.sh
}

src_install() {
	dobin build/release/bin/monero-wallet-gui

	insinto "usr/share/${PN}/translations"
	for my_l10n in ${MY_L10N} ; do
		if use "${my_l10n}" ; then
			l10n=${my_l10n##l10n_}
			newins "build/release/bin/translations/monero-core_${l10n,,}.qm" "monero-core_${l10n}.qm"
		fi
	done

	for icon in images/appicons/* ; do
		filename=${icon##*/}
		newicon -s ${filename/.png} ${icon} monero-wallet-gui.png
	done
	make_desktop_entry "monero-wallet-gui %u" "Monero Wallet" "monero-wallet-gui" "Network;P2P;Office;Finance;" "MimeType=x-scheme-handler/monero;\nTerminal=false"
}
