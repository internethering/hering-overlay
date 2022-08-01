# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils systemd

DESCRIPTION="Create Daily, Weekly and Monthly backups of MySQL databases."
HOMEPAGE="https://github.com/internethering/AutoMySQLBackup"
SRC_URI="https://github.com/internethering/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-arch/bzip2
	app-arch/gzip
	virtual/mysql
"
DEPEND=""

src_install() {
	dobin automysqlbackup
	insinto /etc/automysqlbackup
	mv automysqlbackup.conf{,.example}
	doins automysqlbackup.conf.example
	fperms 600 /etc/automysqlbackup/automysqlbackup.conf.example
	dodoc README.md
	systemd_dounit "${FILESDIR}/automysqlbackup.service"
	systemd_dounit "${FILESDIR}/automysqlbackup.timer"
}
