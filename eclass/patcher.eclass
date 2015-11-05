# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: evermind
# Purpose: 
#

# TODO
#	* redo the options parsing as it is really ugly by now
#	* include option to abort if patch fails
#	* analyze complete arguments

# patch files but don't interrupt if it fails
# (just give a message)
# only one function to use here:
# syntax: patcher "/path/to/patchfile.patch|gz|bz2 apply"

# additional: you can pass  apply or reverse
# As the function is otherwise forced to do one possible
# action: automatically reverse or apply
########################################

# global variables
gPATCHPROG="patch"

#umask 177 
# syntax: fnc_patcher "patchfile.patch" "DECOMPRESS_METHOD"
# patchfile: the file which is the patch
# DECOMPRESS_METHOD: "gzip -d -c" or bzip2 -d -c"
function fnc_decompress_patch(){
	local lPATCHFILE=$1
	local lTOOL=$2
	#local lPATCHFILE=/usr/src/food/git5-rc3
	local lADD_OPTS="-f -l -s"
	local lUNIQ_NR=`date +'%s'`
	local lERR_LEVEL="0"
	
	if [ "x${lTOOL}" != "xcat" ];then
		local lDECOMPRESS_PATCH="${WORKDIR}/.tmp_patch_${lUNIQ_NR}"
		gFNC_RETURN_VAR1=${lDECOMPRESS_PATCH}
		[ -e "$lPATCHFILE" ] && ${lTOOL} $lPATCHFILE > ${lDECOMPRESS_PATCH}
		local lTMP_PATCHFILE=$lDECOMPRESS_PATCH
	else
		local lTMP_PATCHFILE=${lPATCHFILE}
	fi
	gFNC_RETURN_VAR0="${lTMP_PATCHFILE}"
}

function fnc_display_failed_patches(){
	local lFAILED_PATCH_LOG=$1
	local lPATCHED=$2
	if [ -f "${lFAILED_PATCH_LOG}" ] && [ "x${lFAILED_PATCH_LOG}" != "x" ];then
		[ "x${lPATCHED}" == "x0" ] && cat "${lFAILED_PATCH_LOG}"
	fi
}

# to remove any given File
function fnc_remove_tmp_file(){
	local lDELETE_FILE=$1
	[ "x${lDELETE_FILE}" != "x" ] && [ -f "${lDELETE_FILE}" ] && rm -f "${lDELETE_FILE}"
}

function check_force_flag(){
	if [ "$gDie" -eq 1 ];then
		die "patching failed ${lPATCHFILE##*/}"
	fi
}
# here we apply a given patch
function fnc_apply_patch(){
	local lTMP_PATCHFILE="$1"
	local lDECOMPRESS_PATCH="$2"
	local lORIG_PATCHFILE="${3}"
	local lPATCHFILE="${3##*/}"
	local lREVERSE=$4
	local lFAILED_PATCH_LOG="/tmp/${lTMP_PATCHFILE##*/}.log"
	local lPATCHED="0"
	local lAPPLY_POSSIBLE="0"
	if [ ! -e "${lORIG_PATCHFILE}" ];then
		eerror "[not exist] ${lORIG_PATCHFILE}"
		gFNC_RETURN_VAR0="none"
		return 1
	elif [ "x${gWRITE_LIST}" == "xnone" ];then
		gFNC_RETURN_VAR0="none"
	else
		gFNC_RETURN_VAR0=""
	fi
	for lSTRIP in 1 2 3 4;do
		for lFUZ_LEVEL in 2 3 4;do
			##echo ${lTMP_PATCHFILE} hier der patch
			lERR_LEVEL="0"
			if [ "`${gPATCHPROG} ${lADD_OPTS} -p${lSTRIP} -F${lFUZ_LEVEL} --dry-run  < ${lTMP_PATCHFILE} 2>&1|tee ${lFAILED_PATCH_LOG} 2>/dev/null|grep -s -c -m 1 -i -e 'failed' -e 'malformed' -e 'Assume -R' -e 'Skipping patch'`" == "1" ];then
				lERR_LEVEL="1"
			fi
			[ "${lERR_LEVEL}" == "0" ] && lAPPLY_POSSIBLE="1"
			if [ "$lREVERSE" == "1" ];then
				lERR_LEVEL="1"
			elif [ "${lERR_LEVEL}" == "0" ];then
				${gPATCHPROG} ${lADD_OPTS} -p${lSTRIP} -F${lFUZ_LEVEL} < ${lTMP_PATCHFILE} &>/dev/null
				#echo "-p${lSTRIP} -F${lFUZ_LEVEL} ${lTMP_PATCHFILE}"
				einfo "[applied] ${lPATCHFILE}"
				lPATCHED=1
				fnc_remove_tmp_file "${lDECOMPRESS_PATCH}"
				fnc_remove_tmp_file "${lFAILED_PATCH_LOG}"
				return 0
			fi
			###echo "[ "$lREVERSE" == "0" -a "$gLIST_GIVEN" == "1" ]"
			if [ "$lREVERSE" == "0" -a "$gLIST_GIVEN" == "1" ];then
				lERR_LEVEL="0"

			elif [ "${lERR_LEVEL}" == "1" -a "$gDontReverse" == "0" ];then
			 	#echo "-p${lSTRIP} -F${lFUZ_LEVEL} --dry-run -R ${lTMP_PATCHFILE}"
				if [ "`${gPATCHPROG} ${lADD_OPTS} -p${lSTRIP} -F${lFUZ_LEVEL} -R --dry-run < ${lTMP_PATCHFILE} 2>&1|tee ${lFAILED_PATCH_LOG} 2>/dev/null|grep -s -c -m 1 -i -e 'failed' -e 'malformed' -e 'assume -R' -e 'Skipping patch'`" == "1" ];then
					lERR_LEVEL="1"
				else
					lERR_LEVEL="0"
				fi

				if [ "${lERR_LEVEL}" == "0" ];then
					${gPATCHPROG} ${lADD_OPTS} -p${lSTRIP} -F${lFUZ_LEVEL} -R < ${lTMP_PATCHFILE} &>/dev/null
					ewarn "[reversed] ${lPATCHFILE}"
					gREVERSE=1
					fnc_remove_tmp_file "${lDECOMPRESS_PATCH}"
					fnc_remove_tmp_file "${lFAILED_PATCH_LOG}"
					return 2
				fi
			fi
		done

		#echo -e -n "\n[NOT applied] ${lPATCHFILE##*/}"
		if [ "$lAPPLY_POSSIBLE" == "1" ];then
			ewarn "[NOT reversed but applying possible] ${lPATCHFILE##*/} "
			check_force_flag
		else
			[ "${gVERBOSE}" == "1" ] && fnc_display_failed_patches "${lFAILED_PATCH_LOG}" "${lPATCHED}"
			eerror " [NOT applied] ${lPATCHFILE##*/}"
			check_force_flag
		fi
		fnc_remove_tmp_file "${lDECOMPRESS_PATCH}"
		fnc_remove_tmp_file "${lFAILED_PATCH_LOG}"
		return 1
	done
}

# this extract the current path an applies it to given relatives paths
# of a patch/patchlist so we have absolute paths
function fnc_generate_absolute_path(){
	local lPATCHFILE=$1
	local lCURRENT_PATH=`pwd`
	if [ "good${lPATCHFILE}" != "${lPATCHFILE/\//good/}" ];then
		while [ "${lPATCHFILE}" != "${lPATCHFILE#..*}" ];do
			lCURRENT_PATH="${lCURRENT_PATH%/*}"
			lPATCHFILE="${lPATCHFILE#../*}"
		done
		echo "${lCURRENT_PATH}/${lPATCHFILE}"
	else
		echo "${lPATCHFILE}"
	fi
}

function fnc_select_tool(){
	gTOOL="cat"
	local lORIG_PATCHFILE=$1
	local lPATCH_FILE="${lORIG_PATCHFILE##*/}"
	[ "x${lPATCH_FILE}" == "x" ] && lPATCH_FILE=$1
	[ "${lPATCH_FILE%*.tar.bz2}" != "$lPATCH_FILE" ] && gTOOL="tar -xjpf" && export gTARBALL_DIR="${lPATCH_FILE%*.tar.bz2}" && return
	[ "${lPATCH_FILE%*.tar.gz}" != "$lPATCH_FILE" ] && gTOOL="tar -xzpf" && export gTARBALL_DIR="${lPATCH_FILE%*.tar.gz}" && return
	[ "${lORIG_PATCHFILE##*.}" == "bz2" ] && gTOOL="bzip2 -d -c"
	[ "${lORIG_PATCHFILE##*.}" == "gz" ] && gTOOL="gzip -d -c"
}

function fnc_extract_kernel_tarball(){
	local lTARBALL=$1
	echo "[extract] ${lTARBALL##*/}"
	$gTOOL $lTARBALL
	
	[ "x$gTARBALL_DIR" != "x" ] && cd $gTARBALL_DIR && unset gTARBALL_DIR
}

function fnc_generate_patch_list(){
	local lRETURN_VALUE=$1
	local lREVERSED=$2
	local lORIG_PATCHFILE=$3
	local lWRITE_LIST=$4
	
	if [ "$lRETURN_VALUE" == "0" ] && [ "$lREVERSED" == "0" ] && [ "x$lWRITE_LIST" != "xnone" ];then
		echo ${lORIG_PATCHFILE} >> `pwd`/patch-series.lst
	elif [ "$lRETURN_VALUE" == "2" ] && [ "$lREVERSED" == "1" ] && [ "x$lWRITE_LIST" != "xnone" ];then
		echo " [removed] from patch-series.lst"
		sed -i -e "/${lORIG_PATCHFILE##*/}/d" `pwd`/patch-series.lst
	fi
}

function fnc_clean_orig_rej(){
	rm -f "patch-series.lst"
	echo "[clean] *.orig *.rej patch-series.lst"
	find -iname "*.orig" -exec rm -f {} \;
	find -iname "*.rej" -exec rm -f {} \;
	exit 0
}

# this part is if you pass a patcher generated patch-list
# NOTE: patch-list is only available to be compatible with
#	list generated with versions prior to v0.6.
#	Now we can pass every file with the extension '.lst'.
#	
# this launches the fnc_apply_patch for each patch in the list
function fnc_launching_apply_patch(){
	local lREVERSE=$1
	local lPATCH_LIST=$2
	if [ "x${lREVERSE}" == "x0" ];then
		for lPATCH in  `cat ${lPATCH_LIST} |awk '$0 !~ /^#/ {printf "%s ",$0 }'`;do
			fnc_select_tool "${lPATCH}"
			if [ -z "${gTOOL##*tar -x*}" ];then
				fnc_extract_kernel_tarball "${lPATCH}" "$gTARBALL_DIR" "${gTOOL}"
			else
				fnc_decompress_patch "${lPATCH}" "${gTOOL}"
				fnc_apply_patch "${gFNC_RETURN_VAR0}" "${gFNC_RETURN_VAR1}" "${lPATCH}" "${lREVERSE}"
			fi
			#fnc_generate_patch_list "$?" "$lREVERSE" "${lPATCH}" "$gFNC_RETURN_VAR0"
		done
		exit 0
	elif [ "x${lREVERSE}" == "x1" ];then
		for lPATCH in  `cat ${lPATCH_LIST}|awk '$0 !~ /^#/ && $0 !~ /tar.bz2$/ && $0 !~ /tar.gz$/ {printf "%s ",$0 }'|awk ' BEGIN { FS = " " } ; END { for ( i = NF; i > 0; i--) printf "%s ", $i}'`;do
			fnc_select_tool "${lPATCH}"
			fnc_decompress_patch "${lPATCH}" "${gTOOL}"
			fnc_apply_patch "${gFNC_RETURN_VAR0}" "${gFNC_RETURN_VAR1}" "${lPATCH}" "${lREVERSE}"
			#fnc_generate_patch_list "$?" "$lREVERSE" "${lPATCH}" "$gFNC_RETURN_VAR0"
		done
		exit 0
	fi
}

# global vars
gDontReverse=0
gDie=0
gREVERSE=0 
gVERBOSE=0
gWRITE_LIST=none
gLIST_GIVEN=0
gORIG_PATCHFILE=""

function check_cmdline(){
	# check for cmdline parameters
	params_cnt=${#}
	if [ ${#} -eq 0 ];then
		echo "no stuff in here"
		exit
	fi
	while [ ${#} -gt 0 ]
	do
	        a=${1}
	        shift
	        case "${a}" in
	
	        -h|--help)
			# TODO
			echo -e "-d | --debug		enable debug-messages"
			echo -e "-v | --version		display version"
			exit
			;;
		# own real stuff
		-a|--apply)
			gDontReverse=1 
			;;
		-f|--force) # die if applying is not possible
			gDie=1 
			;;
		-r|--reverse)
			gREVERSE=1 
			;;
		-c| --clean)
			fnc_clean_orig_rej
			;;
		-v| --verbose)
			gVERBOSE=1
			;;
		-w| --write-list)
			gWRITE_LIST=""
			;;
		*	)
			# -- process the other options --

			# check if a list of patches is present
			if [ "x${a##*/}" == "xpatch-list" -o "x${a##*.}" == "xlst" ];then
				gLIST_GIVEN=1
				break
			else
				gLIST_GIVEN=0
			fi

			# read patch-name
			gORIG_PATCHFILE="${a}"
			;;   # DEFAULT
		esac
	done
}

##################################call all functions#######################################################################
# syntax:patcher "/path/to/patchfile.patch|gz|bz2 apply"
# additional: restrict em with apply|reverse
function patcher(){
check_cmdline $@
gORIG_PATCHFILE=`fnc_generate_absolute_path "${gORIG_PATCHFILE}"`

[ "$gLIST_GIVEN" == "1" ] && fnc_launching_apply_patch "$gREVERSE" "${gORIG_PATCHFILE}"
fnc_select_tool "${gORIG_PATCHFILE}"
if [ -z "${gTOOL##*tar -x*}" ];then
	fnc_extract_kernel_tarball "${gORIG_PATCHFILE}" "$gTARBALL_DIR" "${gTOOL}"
	exit 0
else
	fnc_decompress_patch "${gORIG_PATCHFILE}" "${gTOOL}"
fi

fnc_apply_patch "${gFNC_RETURN_VAR0}" "${gFNC_RETURN_VAR1}" "${gORIG_PATCHFILE}" "${gREVERSE}"

#fnc_generate_patch_list "$?" "$gREVERSE" "${gORIG_PATCHFILE}" "$gFNC_RETURN_VAR0"

}
