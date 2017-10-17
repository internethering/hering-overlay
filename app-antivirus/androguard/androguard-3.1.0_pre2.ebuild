# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit distutils-r1 versionator

DESCRIPTION="Reverse engineering, Malware and goodware analysis of Android applications"
HOMEPAGE="https://github.com/androguard/androguard"
if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/${PN}/${PN}.git"
	KEYWORDS=""
else
    MY_PV=$(get_version_component_range 1-3)-pre.2
    MY_P="${PN}-${MY_PV}"
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${MY_PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="gui magic graphing"

DEPEND="dev-python/cryptography
	virtual/python-futures
	dev-python/networkx
	dev-python/pygments
	dev-python/pyasn1
	dev-python/ipython
	gui? (
	    dev-python/pyperclip
	    dev-python/PyQt5
	)
	magic? ( || ( dev-python/filemagic dev-python/python-magic ) )
	graphing? ( dev-python/pydot )"
RDEPEND="${DEPEND}"