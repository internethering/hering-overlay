# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )

inherit git-r3

DESCRIPTION="A script that helps you understand why your E-Mail ended up in Spam"
HOMEPAGE="https://github.com/mgeeky/decode-spam-headers"
EGIT_REPO_URI="https://github.com/mgeeky/decode-spam-headers.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/python-dateutil
	dev-python/tldextract
	dev-python/packaging
	dev-python/dnspython
	dev-python/requests
	dev-python/colorama"


src_install() {
	newbin decode-spam-headers.py decode-spam-headers
	newbin correlate-rules.py correlate-rules
}
