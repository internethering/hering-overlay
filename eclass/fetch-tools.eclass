# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose1: function to fetch and compare local files with remote files.
#		
# Purpose2: `usesflag "alsa"` gives 1 back if true else 0
	
#

# short description (long description missing or directly at the functions)
# #################--------------------------------------------------------
# pass multiple urls for same tarball and get first valid back:
# (reason: the location of some files especially 
# the realtime-patch can change quickly)
#				syntax: e.g SRC_URI=$(get_valid_url $URL_1 $URL_2 ...)

# fetch a tarball and compare filesize with remote location
#				syntax: fetch_tarball_cmp "url_tarball"

# compare remote file with local file for same filesize
#				syntax: cmp_remote_local_size "remote_url" local_file_path"

# fetch tarballs which are provided as snapshots and verify filesize
#				syntax:	fetch_tarball_cmp "url_tarball"
# -------------------------------------------------------------------------


# This function gives back the first valid URL:
# call this function above SRC_URI and add 
# ${RET_VALID_URL} to SRC_URI in your ebuild.
# # # #
# Or add this function nested into SRC_URI:
# eg. SRC_URI=`get_valid_url $URL_1 $URL_2`
# or use the return_var RET_VALID_URL (it contains the valid URL)
# ### ###
# SYNTAX: get_valid_url $URL_1 $URL_2 $URL_3 $URL_4 $URL_5 ...
get_valid_url() {
	[ "$run" == "xyes" ] && return 0
	local RET_VALID_URL="$1"
	while [ "${#}" -gt "0" ];do
		local CHECK_URL="${1}"
		shift
		#echo $CHECK_URL    
		wget --spider ${CHECK_URL} &>/dev/null
		local err_val=$?
		#einfo "err_val: $err_val"
		if [ "$err_val" == "0" ];then
			RET_VALID_URL="${CHECK_URL}"
			break
		fi
	done
	run="yes"
	echo ${RET_VALID_URL}
	return 0
}

# compare remote file with local file for same filesize
# syntax: cmp_remote_local_size "remote_url" local_file_path"
cmp_remote_local_size() {
	local remote_file="$1"
	local local_file="$2"
	local remote_file_size="$(LC_ALL=C wget -S --spider "${remote_file}" 2>&1|awk '$0 ~ /Content-Length:/ {print $NF}' 2>/dev/null)"
	if [ "${#remote_file_size}" == "0" ];then
		ewarn "cannot check for valid size"
		return 2
	fi
	
	local local_file_size="$(LC_ALL=C ls -l ${local_file} 2>/dev/null| awk '{print $5}')"
	if [ "${#local_file_size}" == "0" ];then
		ewarn "local file don't exist"
		return 1
	fi
	
	if  [ "${local_file_size}" == "${remote_file_size}" ];then
		einfo "filesize match"
		return 0
	else
		ewarn "filesize mismatch"
		return 1
	fi
}


# syntax: fetch_snapshot_tarball "url_tarball"
fetch_snapshot_tarball() {
	local URL_PREFIX="${1%/*}"
	local MY_TARBALL="${1##*/}"
	local DOWNLOAD="n"
	local timeout="15"
	set_portage_actual_distdir
	if [ -e "${PORTAGE_ACTUAL_DISTDIR}/${MY_TARBALL}" ];then
		einfo "The ${PN} homepage just offers regular snapshots:"
		einfo "your snapshot is from: `LC_ALL=C ls ${PORTAGE_ACTUAL_DISTDIR}/${MY_TARBALL}  --time-style=long-iso -l| awk '{print $6}'`"
		einfo "Do you want Re-download ${PN} tarball? [y,n]"
		einfo "(will automatically download in ${timeout} secs)"
		read -t ${timeout} DOWNLOAD || DOWNLOAD="y"

	else
		DOWNLOAD="y"
	fi
	if [ "${DOWNLOAD}" == "y" ];then
	 	addwrite "${PORTAGE_ACTUAL_DISTDIR}/${MY_TARBALL}"
		rm -f "${PORTAGE_ACTUAL_DISTDIR}/${MY_TARBALL}"
		wget ${URL_PREFIX}/${MY_TARBALL} -P "${PORTAGE_ACTUAL_DISTDIR}" ||\
			die "cannot fetch new ${MY_TARBALL}"
	else
		# nothing redownloaded
		return 2
	fi
}

# syntax fetch_tarball_cmp "url_tarball"
fetch_tarball_cmp() {
	set_portage_actual_distdir
	set_distdir
	local url="$1"
	fetch_snapshot_tarball "${url}"
	if [ "$?" != "2" ];then
		cmp_remote_local_size "${url}" "${PORTAGE_ACTUAL_DISTDIR}/${url##*/}"
		while [ "$?" == "1" ];do
			addwrite "${PORTAGE_ACTUAL_DISTDIR}/${url##*/}"
			rm -f "${PORTAGE_ACTUAL_DISTDIR}/${url##*/}"
			wget ${URL_PREFIX}/${MY_TARBALL} -P "${PORTAGE_ACTUAL_DISTDIR}" ||\
				die "cannot fetch new ${MY_TARBALL}"
			cmp_remote_local_size "${url}" "${PORTAGE_ACTUAL_DISTDIR}/${url##*/}"
		done
	fi
}

# set distdir for unpack()
set_distdir() {
	DISTDIR="${PORTAGE_ACTUAL_DISTDIR}"
}

# due to missing env_var in portage-2.0.x we set it here (locally)
# (this var is present in portage-2.1.x)
set_portage_actual_distdir() {
	if [ "${#PORTAGE_ACTUAL_DISTDIR}" == "0" ];then
		PORTAGE_ACTUAL_DISTDIR="${DISTDIR}"
	fi
}

