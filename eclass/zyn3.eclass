# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: 
#
# tell the user to use the "smart" version of zynaddsubfx-banks /
# zynaddsubfx-extras ebuild which tries to fetch the latest source
use_smart() {
	if [ ! -e "${WORKDIR}" ];then
		if [ ! -e "${WORKDIR%/*}/.unpacked" ];then
			if ! [ -e "${WORKDIR%/*}/.compiled" -o -e  "${WORKDIR%/*}/.installed" ];then
		 		ewarn "If this ebuild fail try:"
				ewarn "ACCEPT_KEYWORDS=~${ARCH} emerge ${PN}"
			fi
		fi
	fi
}

smart_source() {
	local url_prefix=$1
	local search_for=$2
	url="$(wget -qO-  ${url_prefix}|grep -o	"\=.${search_for}.*[[:digit:]]*\.zip\\\""|2>/dev/null sed -e "s:\=.\(${search_for}.*[[:digit:]]*\.zip\)\":\1:" 2>/dev/null)"
	[ "${#url}" == "0" ] && die
	echo "${url_prefix}/${url}"
}
