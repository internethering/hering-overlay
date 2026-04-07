# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


EAPI=8

DESCRIPTION="Dovecot FTS plugin to enable message indexing using Xapian"
HOMEPAGE="https://github.com/grosjo/fts-xapian"
SRC_URI="https://github.com/grosjo/fts-xapian/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="net-mail/dovecot[xapian]
dev-db/sqlite
dev-libs/icu
dev-libs/xapian"

src_unpack() {
	default
	mv ${WORKDIR}/fts-xapian-${PV} ${WORKDIR}/${PF}
}

src_configure() {
	autoupdate
	autoreconf -vi
	./configure --prefix=/usr --with-dovecot=/usr/lib64/dovecot
}
