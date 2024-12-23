# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Meta ebuild for GNU Mailman 3"
HOMEPAGE="https://list.org/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="acct-group/mailman
        acct-user/mailman"
RDEPEND=">=net-mail/mailman-3.0
	net-mail/postorius
	net-mail/hyperkitty
	net-mail/mailman-web
	net-mail/mailman-hyperkitty"
