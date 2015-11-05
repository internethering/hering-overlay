# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator python
MY_P="${PN}-$(replace_all_version_separators '_')"

DESCRIPTION="SAMBA Config GUI"
HOMEPAGE="http://fedoraproject.org/wiki/SystemConfig/samba"
SRC_URI="https://git.fedorahosted.org/cgit/system-config-samba.git/snapshot/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/python-slip \
dev-python/decorator"
RDEPEND="${DEPEND}"

src_prepare() {
    python_convert_shebangs -r 2 .
}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
