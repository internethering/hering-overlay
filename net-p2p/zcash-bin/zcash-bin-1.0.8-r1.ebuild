# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

MY_PN="${PN/-bin/}"
MY_PVR="${PVR/r/}"

DESCRIPTION="a cryptocurrency that fully protect privacy of transactions"
HOMEPAGE="https://z.cash/"
SRC_URI="https://apt.z.cash/pool/main/z/${MY_PN}/${MY_PN}-${MY_PVR}-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /usr/share/bash-completion/completions
	doins usr/share/bash-completion/completions/*

	insinto /usr/share/man/man1
	doins usr/share/man/man1/*

	insinto /usr/share/doc/zcash
	doins usr/share/doc/zcash/*

	insinto /usr/share/doc/zcash/examples
	doins usr/share/doc/zcash/examples/zcash.conf

	dobin usr/bin/*
}
