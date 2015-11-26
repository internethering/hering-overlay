# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1 git-2

DESCRIPTION="fan control software for IBM/Lenovo ThinkPads"
HOMEPAGE="https://github.com/tpfanco/tpfanco-legacy"
EGIT_REPO_URI="git://github.com/tpfanco/tpfanco-legacy.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="profiles"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="dev-python/dbus-python
	sys-apps/systemd
	!app-laptop/thinkfan
	profiles? ( app-laptop/tpfand-profiles )"
RDEPEND="${DEPEND}"

src_compile() {
	return
}

src_install() {
	cd tpfand
	emake DESTDIR="${D}" install-systemd || die "emake failed"
	mkdir ${D}/usr/lib/systemd/system
	mv ${D}/etc/systemd/system/tpfand.service ${D}/usr/lib/systemd/system
	rm -rf ${D}/etc/systemd
}

