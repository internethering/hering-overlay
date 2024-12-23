# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi systemd tmpfiles

DESCRIPTION="Mailman -- the GNU mailing list manager"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"
IUSE="cron test html2text postgresql systemd whoosh xapian"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiosmtpd-1.4.1[${PYTHON_USEDEP}]
	dev-python/alembic[${PYTHON_USEDEP}]
	dev-python/atpublic[${PYTHON_USEDEP}]
	>=dev-python/authheaders-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/authres-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/click-8.0[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/falcon-2.0.0[${PYTHON_USEDEP}]
	dev-python/flufl-bounce[${PYTHON_USEDEP}]
	>=dev-python/flufl-i18n-2.0.1[${PYTHON_USEDEP}]
	>=dev-python/flufl-lock-3.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/importlib_resources[${PYTHON_USEDEP}]
	' python3_8)
	www-servers/gunicorn[${PYTHON_USEDEP}]
	dev-python/lazr-config[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.0[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/zope-component[${PYTHON_USEDEP}]
	dev-python/zope-configuration[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-5.0[${PYTHON_USEDEP}]
	dev-lang/sassc
	html2text? ( www-client/lynx )
	postgresql? ( dev-python/psycopg[${PYTHON_USEDEP}] )
	xapian? ( dev-libs/xapian )
	whoosh? ( dev-python/whoosh[${PYTHON_USEDEP}] )
	virtual/mta
"
BDEPEND="
	test? (
		dev-python/flufl-testing[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]
	)
"

python_install() {
	distutils-r1_python_install

	keepdir /var/spool/mailman /var/log/mailman /etc/mailman.d
	fowners mailman:mailman /var/spool/mailman /var/log/mailman /etc/mailman.d

	insinto /etc
	doins "${FILESDIR}"/mailman.cfg
	dotmpfiles "${FILESDIR}"/mailman.conf

	if use systemd ; then
		systemd_dounit "${FILESDIR}"/mailman3.service
		systemd_dounit "${FILESDIR}"/mailman3-cron.service
		systemd_dounit "${FILESDIR}"/mailman3-cron.timer
	fi

	if use cron ; then
		exeinto /etc/cron.daily
		doexe "${FILESDIR}"/mailman3.cron
	fi
}


