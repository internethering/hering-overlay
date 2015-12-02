# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="ACME protocol implementation in Python"
HOMEPAGE="https://github.com/letsencrypt/letsencrypt"
MY_PV="$(get_version_component_range 1-3).dev$(get_version_component_range 4)"
SRC_URI="https://github.com/letsencrypt/letsencrypt/archive/v${MY_PV}.tar.gz"
S="${WORKDIR}/letsencrypt-${MY_PV}/acme"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/cryptography
	dev-python/ndg-httpsclient
	dev-python/pyasn1
	dev-python/pyrfc3339
	dev-python/pytz
	dev-python/requests
	dev-python/six
	dev-python/werkzeug"
