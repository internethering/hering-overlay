# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit cmake-utils systemd

DESCRIPTION="a cryptocurrency with a focus on private and censorship-resistant transactions"
HOMEPAGE="https://getmonero.org/"

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/monero-project/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/monero-project/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Monero"
SLOT="0"
DOCS=""
IUSE="upnp unwind lzma ldns expat doc graphviz debug munin systemd qt5"
REQUIRED_USE="lzma? ( unwind )
graphviz? ( doc )"

DEPEND="dev-libs/boost
	dev-libs/openssl:0
	sys-libs/libunwind
	upnp? ( net-libs/miniupnpc:0/16 )
	unwind? ( sys-libs/libunwind )
	ldns? ( net-libs/ldns )
	lzma? ( app-arch/xz-utils )
	expat? ( dev-libs/expat )
	doc? ( app-doc/doxygen )
	graphviz? ( media-gfx/graphviz )"

RDEPEND="munin? ( net-analyzer/munin )
	systemd? ( sys-apps/systemd )"

PDEPEND="qt5? ( net-p2p/monero-core )"

src_compile() {
	if use doc ; then
		use graphviz && doxygen Doxyfile || HAVE_DOT=YES doxygen Doxyfile
	fi
}

src_install() {
	use doc && HTML_DOCS=( "${S}/doc/html/*" )

	cmake-utils_src_install

	insinto etc
	doins utils/conf/monerod.conf

	use systemd && systemd_dounit utils/systemd/monerod.service

	if use munin ; then
		insinto "usr/libexec/${PN}/munin_plugins"
		doins -r utils/munin_plugins
	fi
}
