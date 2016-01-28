# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Systemd services for rt-kernel"
HOMEPAGE="https://der.internethering.de"
SRC_URI="https://der.internethering.de/projects/${PN}/${P}.tar.bz2"

inherit systemd

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="jack cpupower"

DEPEND="sys-apps/systemd
	sys-process/rtirq
	jack? ( media-sound/jack-audio-connection-kit[dbus] )
	cpupower? ( sys-power/cpupower )"
RDEPEND="${DEPEND}"

src_install() {
	if use jack ; then
		systemd_douserunit jack/a2jmidid.service
		systemd_douserunit jack/audio.slice
		systemd_douserunit jack/audio.target
		systemd_douserunit jack/jackdbus.service
	fi

	if use cpupower ; then
		insinto /etc/default
		newins cpupower-rt/config cpupower-rt

		exeinto /usr/lib/systemd/scripts
		newexe cpupower-rt/script cpupower-rt

		systemd_dounit cpupower-rt/cpupower-rt.service
	fi	
}
