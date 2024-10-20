# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="Mailman -- the GNU mailing list manager"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="3"
KEYWORDS="~amd64"
IUSE="test"
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
"
BDEPEND="
	test? (
		dev-python/flufl-testing[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]
	)
"
