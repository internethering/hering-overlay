# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="Let's Encrypt client"
HOMEPAGE="https://github.com/letsencrypt/letsencrypt"
MY_PV="$(get_version_component_range 1-3).dev$(get_version_component_range 4)"
SRC_URI="https://github.com/letsencrypt/letsencrypt/archive/v${MY_PV}.tar.gz"
S="${WORKDIR}/letsencrypt-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="apache2 nginx"

DEPEND=""
RDEPEND="dev-python/cryptography
    dev-python/pyrfc3339
    dev-python/pytz
    dev-python/requests
    dev-python/six
	dev-python/zope-interface
	dev-python/zope-component
	>=dev-python/pyopenssl-0.15
	dev-python/mock
	dev-python/pythondialog:python-2
	>=dev-python/psutil-3.2.2
	dev-python/parsedatetime
	dev-python/configargparse
	dev-python/configobj
	app-crypt/acme
	nginx? ( app-crypt/letsencrypt-nginx )
	apache2? ( app-crypt/letsencrypt-apache )"
