# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
IUSE="${IUSE} patch"

# eclass for lash-support
# lash is the successor of ladcca
# so now every program which uses ladcca musst be patched to fit 
# the new name scheme

# ##############################
# short introduction:
# just add this to your ebuild:
#inherit lash

# src_unpack() {
#     cd ${S}
#     ladcca_to_lash
# }
# and sometimes you need to run ./autogen.sh (if your package support it)
# src_compile(){
#	./autogen.sh
# } 
# 
# now If you want to check if your ebuild get patched fine you
# can start the ebuild with
# USE=patch emerge yourebuild
# this will generate a diff (which you can use if the conversion-process
# is to long) and also checks if some symbols are left
# in the latter case contact me or just adjust this eclass yourself.
# In function ladcca_lash_convert add synbols at the right for-loop.
# The ebuild will not be built and portage interrupt
# --evermind--
################################				

replace_string() {
	# this function replaces strings in a text file with awk
	# SYNTAX replace_string "$OLD_STRING" "$NEW_STRING" "$FILE"
	# special caracters need to be masked with backslashes in $OLD_STRING
	local OLD_STRING=$1
	local NEW_STRING=$2
	local FILE=$3
	#	einfo alter string $1
	[ -z "$OLD_STRING" ] && return
	[ -e $FILE  ] && sed -i 's/'${OLD_STRING}'/'${NEW_STRING}'/g' $FILE || einfo " ${FILE} not exist"
	if [ $? -ne 0  ];then
		eerror "ERROR occured with FILE $FILE in function replace_string"
		return
	elif [ $? == 1  ];then
		[ -e $FILE  ] && einfo "Patching: $FILE"
		echo -n
	fi
}

replace_stuff() {
	cnt=0
	for string in ${OLD_STRINGS[*]};do
		if [ ! -z $string ];then
			#echo Replacing: "${OLD_STRINGS[$cnt]}" with "${NEW_STRINGS[$cnt]}" 
			for file_name in `grep -l -m1 -R $string *`;do
				[ -z $file_name ] && ewarn $file_name
				replace_string "${OLD_STRINGS[$cnt]}" "${NEW_STRINGS[$cnt]}" "$file_name" || die
			done
		fi
		let cnt+=1
	done
}

ladcca_lash_convert() {
	cnt="0"
	# begin 1st part: replace all LADCCA
	for i in HAVE_LADCCA LADCCA_CFLAGS LADCCA_LIBS LADCCA_PKG_ERRORS LADCCA_FOUND LADCCA_VERSION LADCCA;do
		OLD_STRINGS[$cnt]="${i}"
		NEW_STRINGS[cnt++]="${i/LADCCA/LASH}"
	done

	# begin 2nd part: replace include files
	OLD_STRINGS[$cnt]="ladcca\\/ladcca.h"
	NEW_STRINGS[cnt++]="lash\\/lash.h"

	# begin 3rd part: replace ladcca
	for i in enable_ladcca able-ladcca ladcca;do
		OLD_STRINGS[$cnt]="${i}"
		NEW_STRINGS[cnt++]="${i/ladcca/lash}"
	done
	# begin 4th part: replace cca
	for i in cca_alsa cca_args cca_client cca_create_dir cca_dir cca_dir cca_event cca_exec cca_file_exists cca_get cca_list cca_malloc cca_protocol_string cca_protocol_t cca_realloc cca_remove_dir cca_send cca_server_connected cca_str cca_xmalloc cca_xrealloc cca_xstrdup cca_flags cca_enabled cca_save cca_idle cca_extract cca_init cca_jack cca_config cca_run cca_load cca_thread;do
		OLD_STRINGS[$cnt]="${i}"
		NEW_STRINGS[cnt++]="${i/cca/lash}"
	done

	# begin 5th part: replace CCA
	for i in CCA_Config CCA_PROTOCOL CCA_Client CCA_Save CCA_Restore CCA_Quit CCA_Server CCA_Terminal CCA_Alsa;do
		OLD_STRINGS[$cnt]="${i}"
		NEW_STRINGS[cnt++]="${i/CCA/LASH}"
	done
	
	OLD_STRINGS[$cnt]="Ladcca"
	NEW_STRINGS[cnt++]="Lash"
		

	replace_stuff


	#for i in `grep -l -m1 -R CCA *`;do sed -i 's/CCA/LASH/g' $i || die;done
}

# generate patch to submit to upstream-maintainer
generate_patch() {
	tmp_dir="${S%/*}/.clean${PN}"
	patch_file="${S%/*}/${PN}-convert_to_lash.patch"
	diff_excludes="-x ChangeLog -x Changelog -x changelog -x NEWS -x README -x AUTHORS"
	cp -a "${S}" "${tmp_dir}"
	ladcca_lash_convert
	[ -e "${patch_file}" ] && rm -f "${patch_file}"
	echo -e "this patch is created automatically with lash.eclass\n\n" >  "${patch_file}"
	diff -urN ${diff_excludes} ${tmp_dir}  ${S} >>  "${patch_file}"
	sed -i 's|'${S}'|'${P}.new'|g' "${patch_file}"
	sed -i 's|'${tmp_dir}'|'${P}.old'|g' "${patch_file}"
	sed -i 's|-x ChangeLog -x Changelog -x changelog -x NEWS -x README -x AUTHORS ||g' "${patch_file}"
	ewarn
	ewarn you request to generate a patch to convert to lash
	ewarn here it is "$patch_file"
	einfo
	rm "${tmp_dir}" -rf 
	
	ewarn "If the following output displays still some ladcca variable"
	ewarn "you have to adjust your lash.eclass or submit this output to"
	ewarn "stamm att flashmail dot com"
	sleep 3
	grep -R -e 'CCA' -e 'cca_' -e '_cca' -e 'ladcca' -e 'LADCCA' 'Ladcca'  "${S}"
	eerror "This error is NOT an error it just stops the ebuild to be build"
	eerror "If you want to build this package try USE=-patch"
	die 

}

ladcca_to_lash() {
	if use patch ;then
		generate_patch
	elif use lash ;then
		ladcca_lash_convert
	fi
}
