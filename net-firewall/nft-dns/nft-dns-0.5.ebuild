# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Make nftables resolve fqdn on-the-fly"
HOMEPAGE="https://github.com/azlux/nft-dns"
SRC_URI="https://github.com/azlux/${PN}/archive/refs/tags/${PV}.tar.gz -> nft-dns-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/pydantic
	dev-python/dnspython
	net-firewall/nftables"

src_install() {
	newdoc MANUAL.md nft-dns.md

	insinto /usr/share/nft-dns
	doins entry.py

	exeinto /usr/share/nft-dns
	doexe nft-dns.py

	dosym /usr/share/nft-dns/net-dns.py /usr/bin/net-dns

	insinto /etc
	doins nft-dns.conf

	systemd_dounit "${FILESDIR}"/nft-dns.service
}