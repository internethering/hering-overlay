# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd git-r3

DESCRIPTION="oletools verify over TCP socket"
HOMEPAGE="https://github.com/HeinleinSupport/olefy"
EGIT_REPO_URI="https://github.com/HeinleinSupport/olefy.git"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS=""

DEPEND="acct-group/olefy
    acct-user/olefy"

RDEPEND="dev-python/python-magic
	dev-python/colorclass
	app-antivirus/oletools
"

PATCHES=(
        "${FILESDIR}/systemd.patch"
        "${FILESDIR}/olevba.patch"
)

src_install() {
	systemd_dounit olefy.service
	newbin olefy.py olefy
	insinto /etc
	doins olefy.conf
}