# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd tmpfiles

DESCRIPTION="Apache Tika - a content analysis toolkit"
HOMEPAGE="https://tika.apache.org/"
SRC_URI="https://dlcdn.apache.org/tika/${PV}/${PF}.zip"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="acct-group/tika
	acct-user/tika
	>=virtual/jre-17
"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/tika

	insinto /usr/share/tika/
	doins -r lib
	doins -r plugins
	doins ${PF}.jar
	doins bin/tika.in.sh

	systemd_newunit "${FILESDIR}/tika-4.service" tika.service
	dotmpfiles "${FILESDIR}"/tika.conf

	keepdir usr/share/tika/logs
	fowners tika:tika usr/share/tika/logs
	dosym -r "/usr/share/tika/logs" var/log/tika
}

pkg_postinst() {
	elog "If you have multiple Java versions you may set user java-vm to a version >=17."
	elog "see https://wiki.gentoo.org/wiki/Java#Setting_a_default"
}
