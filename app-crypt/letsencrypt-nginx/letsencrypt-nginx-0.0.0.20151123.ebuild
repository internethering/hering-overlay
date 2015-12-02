# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 versionator

DESCRIPTION="Nginx plugin for Let's Encrypt client"
HOMEPAGE="https://github.com/letsencrypt/letsencrypt"
MY_PV="$(get_version_component_range 1-3).dev$(get_version_component_range 4)"
SRC_URI="https://github.com/letsencrypt/letsencrypt/archive/v${MY_PV}.tar.gz"
S="${WORKDIR}/letsencrypt-${MY_PV}/letsencrypt-nginx"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/pyparsing
	dev-python/zope-interface
	>=dev-python/pyopenssl-0.15
	www-servers/nginx"
