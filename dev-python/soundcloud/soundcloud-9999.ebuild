# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 )

inherit distutils-r1 git-r3

DESCRIPTION="A friendly wrapper around the Soundcloud API."
HOMEPAGE="https://github.com/soundcloud/soundcloud-python"
EGIT_REPO_URI="https://github.com/soundcloud/soundcloud-python.git"

LICENSE="Soundcloud"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
dev-python/requests
dev-python/simplejson
dev-python/fudge
dev-python/nose
dev-python/six
"
