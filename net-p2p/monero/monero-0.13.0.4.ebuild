# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils systemd user git-r3

DESCRIPTION="Monero: the secure, private, untraceable cryptocurrency"
HOMEPAGE="https://getmonero.org/"
EGIT_REPO_URI="https://github.com/monero-project/${PN}.git"

if [[ "${PV}" = "9999" ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
	EGIT_COMMIT="v${PV}"
fi

LICENSE="Monero"
SLOT="0"
DOCS=""
IUSE="upnp debug unwind lzma ldns expat doc graphviz debug munin systemd static-libs utils"
REQUIRED_USE="lzma? ( unwind )
graphviz? ( doc )"

DEPEND="dev-libs/boost
	dev-libs/openssl:0
	net-dns/unbound[threads]
	net-libs/cppzmq
	sys-libs/libunwind
	dev-util/cmake
	upnp? ( net-libs/miniupnpc )
	unwind? ( sys-libs/libunwind )
	ldns? ( net-libs/ldns )
	lzma? ( app-arch/xz-utils )
	expat? ( dev-libs/expat )
	doc? ( app-doc/doxygen )
	graphviz? ( media-gfx/graphviz )"

RDEPEND="munin? ( net-analyzer/munin )
	systemd? ( sys-apps/systemd )
	!net-p2p/monero-core[daemon]"

BUILD_DIR="${S}/build/release"

src_compile() {
	if use debug ; then
		BUILD_DIR="${S}/build/debug"
		emake debug
	else
		use static-libs && emake release-static || emake
	fi

	cd "${BUILD_DIR}"
	if use doc ; then
		use graphviz && doxygen Doxyfile || HAVE_DOT=YES doxygen Doxyfile
	fi
}

src_install() {
	cmake-utils_src_install

	if use utils ; then
		dobin "${BUILD_DIR}/bin/monero-blockchain-export"
		dobin "${BUILD_DIR}/bin/monero-blockchain-import"
		dobin "${BUILD_DIR}/bin/monero-utils-deserialize"
	fi

	if use doc ; then
		HTML_DOCS=( "/docs/html/" )
		einstalldocs
	fi

	insinto etc
	doins utils/conf/monerod.conf

	newinitd "${FILESDIR}/monerod.initd" monerod

	use systemd && systemd_dounit utils/systemd/monerod.service

	if use munin ; then
		insinto "usr/libexec/${PN}/munin_plugins"
		doins -r utils/munin_plugins
	fi

	diropts -m755 -o monero -g monero
	dodir var/lib/monero
	dodir var/log/monero
}

pkg_setup() {
	enewuser monero
}

pkg_postinst() {
	esethome monero /var/lib/monero
}