# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: check if jack is compiled with jackmidi useflag
#
need_jackmidi() {
	tool="$(type -p strings 2>/dev/null)"
	[ "${#tool}" == "0" ] && eerror "program \"strings\" not found" && die
	jackmidi="$(${tool} /usr/lib/libjack.so 2>/dev/null|grep -i jack_midi 2>/dev/null)"
	if [ "${#jackmidi}" == "0" ];then
		eerror "jackmidi support is missing"
		eerror "Please recompile jack-audio-connection-kit"
		eerror "with USE=jackmidi"
		eerror "or emerge jack-audio-connection-kit-svn"
		eerror "which includes jackmidi without USE-flag"
		die
	else	
		einfo "jackmidi support [OK]"
	fi
}
