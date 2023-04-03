# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )

inherit autotools eutils python-single-r1 systemd

DESCRIPTION="Allows you to easily put programs and users in a chrooted environment"
HOMEPAGE="http://olivier.sessink.nl/jailkit/"
SRC_URI="http://olivier.sessink.nl/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

RDEPEND="systemd? ( sys-apps/systemd )"

src_prepare() {
	eapply \
		"${FILESDIR}/pyc.patch" \
		"${FILESDIR}/noshells.patch"
	eautoreconf
	default
}

src_install() {
	emake DESTDIR="${D}" PYTHONINTERPRETER=${PYTHON} install || die "emake install failed"

	doinitd "${FILESDIR}/jailkit.initscript"
	if use systemd ; then
		systemd_dounit "${FILESDIR}/jailkit.service"
	fi

	sed -i -e 's:^#!.*:#!/usr/bin/env python3:' "${ED}"/usr/sbin/* || die
	python_fix_shebang "${ED}"
}

pkg_postinst() {
	ebegin "Updating /etc/shells"
	{ grep -v "^/usr/sbin/jk_chrootsh$" "${ROOT}"etc/shells; echo "/usr/sbin/jk_chrootsh"; } > "${T}"/shells
	mv -f "${T}"/shells "${ROOT}"etc/shells
	eend $?
}
