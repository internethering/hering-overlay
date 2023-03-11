# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A dovecot antispam plugin supporting multiple backends"
HOMEPAGE="http://wiki2.dovecot.org/Plugins/Antispam/"
EGIT_REPO_URI="https://git.sipsolutions.net/dovecot-antispam.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="spamassassin"

RDEPEND=">=net-mail/dovecot-2.1.16"
DEPEND="${RDEPEND}
	spamassassin? ( mail-filter/spamassassin )"

DOCS=( README )

src_install() {
	mkdir -p "${D}/usr/lib64/dovecot"
	emake DESTDIR="${D}" INSTALLDIR="/usr/lib64/dovecot" install

	newman antispam.7 dovecot-antispam.7

	if use spamassassin ; then
		dosbin "${FILESDIR}/sa-learn-pipe"
	fi

	insinto /etc/dovecot/conf.d
	doins "${FILESDIR}/90-antispam.conf"
}

pkg_postinst() {
	elog
	elog "You will need to install mail-filter/dspam or app-text/crm114"
	elog "if you want to use the related backends in dovecot-antispam."
	elog

	if use spamassassin ; then
		elog
		elog "If using sa-learn-pipe, you have to config a for the dovecot readable bayes directory at spamassassin."
		elog
	fi
}
