# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: Tom "gimpel" Kuther
# Purpose: VST support handling
#

ECLASS="vst"
INHERITED="$INHERITED $ECLASS"

RDEPEND="vst? ( >=app-emulation/wine-0.9.5 )"
DEPEND="vst? ( =media-libs/vst-sdk-2.3*
			app-arch/zip )"

# returns 0 if answer is yes, 1 otherwhise
agree_vst() {
	local ANSWER="no"
	einfo "Are you building ${P} for personal use (rather than distribution to others)?"
	einfo "Type [yes/no] - (default: no)"
	
	read ANSWER
	if [ "$ANSWER" == "y" ] || [ "$ANSWER" == "yes" ];then
		einfo "OK, VST support will be enabled"
		return 0
	else
		eerror "You cannot build ${P} with VST support for distribution to others."
		eerror "It is a violation of several different licenses"

		eerror "use: USE=-vst emerge ${PN}"
		eerror "to disable vst support"
		return 1
	fi
}

ardour_vst_prepare() {
	# adjust files for vst support
	if use vst; then
		# delete vst question
		touch ${S}/.personal_use_only
		# fix vst header
		sed -ie	's@vstsdk2.3/source/common/aeffectx.h@/usr/include/vst/aeffectx.h@g' \
			libs/fst/SConscript || die "change vst-header location"
		#symlink the include vst include files
		vst_tmp_dir="vstsdk2.3/source/common"
		mkdir -p ${vst_tmp_dir}
		cp -r  /usr/include/vst/./ ${vst_tmp_dir}
		zip -0r  libs/fst/vstsdk2.3.zip vstsdk2.3 &>/dev/null
	fi
}
