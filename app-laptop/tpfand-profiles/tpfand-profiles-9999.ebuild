# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1 git-2

DESCRIPTION="profiles for app-laptop/tpfand"
HOMEPAGE="https://github.com/tpfanco/tpfanco-legacy"
EGIT_REPO_URI="git://github.com/tpfanco/tpfanco-legacy.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_compile() {
	return
}

src_install() {
	cd tpfand-profiles
	emake DESTDIR="${D}" install || die "emake failed"
}
