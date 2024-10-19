# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="RustDesk Server"
HOMEPAGE="https://rustdesk.com/"

SRC_URI="https://github.com/rustdesk/${PN}/archive/refs/tags/${MY_PVR}.tar.gz -> ${MY_P}.tar.gz"

MY_PVR="${PVR/r/}"
MY_P="${PN}-${MY_PVR}"
S="${WORKDIR}/${MY_P}"

LICENSE="AGPL-3"
KEYWORDS="~amd64"

DEPEND="sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND="virtual/rust"

src_unpack() {
	unpack "${MY_P}.tar.gz" || die "Cannot unpack!"
}

src_prepare() {
	default
	cargo update || die "Cannot update Cargo!"
}

src_compile() {
	cargo build --release || die "Cannot build Package!"
}

src_install() {
	dosbin target/release/hbbr || die "Cannot install Binary"
	dosbin target/release/hbbs || die "Cannot install Binary"
	systemd_dounit "${FILESDIR}/rustdesk-hbbr.service" || die "Cannot install Service-Unit"
	systemd_dounit "${FILESDIR}/rustdesk-hbbs.service" || die "Cannot install Service-Unit"
	keepdir /var/lib/rustdesk-server/
	dodoc LICENSE
}
