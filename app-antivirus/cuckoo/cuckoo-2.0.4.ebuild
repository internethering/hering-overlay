# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit distutils-r1 user

DESCRIPTION="automated malware analysis system"
HOMEPAGE="https://github.com/cuckoosandbox/cuckoo"
if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/cuckoosandbox/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/cuckoosandbox/${PN}/archive/${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
	enewuser cuckoo
}
