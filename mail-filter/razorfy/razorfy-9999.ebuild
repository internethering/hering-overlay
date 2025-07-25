# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd git-r3

DESCRIPTION="Small Perl Daemon to use razor over TCP sockets. Mainly to use razor in Rspamd."
HOMEPAGE="https://github.com/HeinleinSupport/razorfy"
EGIT_REPO_URI="https://github.com/HeinleinSupport/razorfy.git"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS=""

DEPEND="acct-group/razorfy
    acct-user/razorfy"

RDEPEND="mail-filter/razor
	virtual/perl-Data-Dumper
	virtual/perl-IO-Socket-IP
	virtual/perl-IO
"

PATCHES=(
    "${FILESDIR}/systemd.patch"
)

src_install() {
	systemd_dounit razorfy.service
	newbin razorfy.pl razorfy
	insinto /etc
	doins razorfy.conf
}