# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )

inherit cvs autotools eutils python-single-r1 systemd

DESCRIPTION="Allows you to easily put programs and users in a chrooted environment"
HOMEPAGE="http://olivier.sessink.nl/jailkit/"

ECVS_SERVER="cvs.savannah.nongnu.org:/sources/jailkit"
ECVS_MODULE="jailkit"
ECVS_LOCALNAME="${P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="systemd"

RDEPEND="systemd? ( sys-apps/systemd )"

src_prepare() {
	epatch \
		"${FILESDIR}/pyc.patch" \
		"${FILESDIR}/noshells.patch"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" PYTHONINTERPRETER=${PYTHON} install || die "emake install failed"

	doinitd "${FILESDIR}/jailkit.initscript"
	if use systemd ; then
		systemd_dounit "${FILESDIR}/jailkit.service"
	fi

	python_fix_shebang "${ED}"
}

pkg_postinst() {
	ebegin "Updating /etc/shells"
	{ grep -v "^/usr/sbin/jk_chrootsh$" "${ROOT}"etc/shells; echo "/usr/sbin/jk_chrootsh"; } > "${T}"/shells
	mv -f "${T}"/shells "${ROOT}"etc/shells
	eend $?
}
