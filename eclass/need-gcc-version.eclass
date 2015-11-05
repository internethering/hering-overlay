# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: die if not set to right gcc version
#
IUSE="${IUSE} patch"

inherit toolchain-funcs
# SYNTAX: need_gcc MAJOR.MINOR (need_gcc 3.4)
need_gcc() {
if [ "$(use_enable patch)" == "--disable-patch" -a "$1" != "$(gcc-version)" ];then
	msg="switch to "$1".X compiler with gcc-config."
	eerror "$msg"
	eerror "If you can provide a gcc4 patch send it to:"
	eerror "stamm att flashmail dot com"
	einfo "to override this message: USE=\"patch\" emerge ${PN}"
	die "$msg"
fi
}
