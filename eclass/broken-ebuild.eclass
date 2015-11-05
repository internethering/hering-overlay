# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: to mention that a package/ebuild is borked
#

EXPORT_FUNCTIONS pkg_setup
SECS=5

pkg_setup() {
	eerror "This package ${P} and or its ebuild is known to be"
	eerror "broken please consider fixing it if you know how to:)"
	eerror "CTRL+C to exit or wait ${SECS}s and try to compile it"
	echo
	eerror " --evermind--"
	sleep ${SECS}s
}
