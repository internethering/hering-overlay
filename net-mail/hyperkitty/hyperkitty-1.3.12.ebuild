# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="A web interface to access GNU Mailman v3 archives"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/django-gravatar2[${PYTHON_USEDEP}]
    dev-python/django-q[${PYTHON_USEDEP}]
    dev-python/djangorestframework[${PYTHON_USEDEP}]
    dev-python/django-compressor[${PYTHON_USEDEP}]
    dev-python/rjsmin[${PYTHON_USEDEP}]
    dev-lang/sassc
    net-mail/mailmanclient[${PYTHON_USEDEP}]
    dev-python/robot-detection[${PYTHON_USEDEP}]
    dev-python/pytz
    dev-python/django-paintstore[${PYTHON_USEDEP}]
    dev-python/python-dateutil[${PYTHON_USEDEP}]
    dev-python/networkx[${PYTHON_USEDEP}]
    dev-python/enum34[${PYTHON_USEDEP}]
    dev-python/django-haystack[${PYTHON_USEDEP}]
    dev-python/django-extensions[${PYTHON_USEDEP}]
    net-mail/django-mailman3[${PYTHON_USEDEP}]
    dev-python/lockfile[${PYTHON_USEDEP}]"

BDEPEND="${RDEPEND}
    dev-python/sphinx[${PYTHON_USEDEP}]
  	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/whoosh[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
	)"

DOCS=( README.rst )
S="${WORKDIR}/HyperKitty-${PV}"
