# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

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
	insinto /usr/share/tika-server-standard/
	newins ${PF}.jar ${PN}.jar

	systemd_dounit "${FILESDIR}/tika.service"
}
