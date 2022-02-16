# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dovecot FTS plugin to enable message indexing using Xapian"
HOMEPAGE="https://github.com/slusarz/dovecot-fts-flatcurve"
SRC_URI="https://github.com/slusarz/${PN}/archive/v${PV}.tar.gz -> dovecot-fts-flatcurve-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="net-mail/dovecot[stemmer]
dev-libs/xapian"

src_configure() {
	./autogen.sh
	./configure --with-dovecot=/usr/lib64/dovecot
}
