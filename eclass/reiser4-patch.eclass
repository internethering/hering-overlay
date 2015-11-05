# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: add reiser4 to vanilla-kernel from mm-sources
#
inherit eutils
add_reiser4() {
	local MM_BROKEN_OUT="$1"
	local DROP_PATCHES="$2"
	cd ${WORKDIR}
	unpack ${MM_BROKEN_OUT}
	cd ${WORKDIR}/broken-out
	R4_PATCH_SERIES="`grep -v '#' series|grep reiser4`"
	cd ${S}
	##cnt=0
	for PATCH in ${R4_PATCH_SERIES[@]};do
		##UNIPATCH_LIST[$cnt]=${WORKDIR}/broken-out/$PATCH
		##let cnt+=1
		apply=1
		for DROP in ${DROP_PATCHES[@]};do
			if [ -z "${PATCH##*${DROP}*}" ];then
				apply=0
				break
			else
				apply=1
			fi
		done
		if [ "$apply" == "1" ];then
			einfo Applying $PATCH
			patch -p1 -F3 < ${WORKDIR}/broken-out/$PATCH &>/dev/null || die
		fi
	done
}
