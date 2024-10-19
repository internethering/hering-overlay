# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1 pypi

DESCRIPTION="Django project that contains default and url settings for Mailman3 Web Interface"
HOMEPAGE="https://pypi.org/project/mailman-web/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql test"
RESTRICT="!test? ( test )"

RDEPEND="net-mail/hyperkitty[${PYTHON_USEDEP}]
	net-mail/postorius[${PYTHON_USEDEP}]
	dev-python/cmarkgfm[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	mysql? ( dev-python/mysqlclient[${PYTHON_USEDEP}] )"
