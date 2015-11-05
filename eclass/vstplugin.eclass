# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: gimpel@sonnenkinder.org
# Purpose: Show some info on pkg_postinst
#

ECLASS="vstplugin"
INHERITED="$INHERITED $ECLASS"

inherit vst

vstplugin_pkg_postinst() {
	elog
	einfo "In order to use native Linux VST plugins, you will need"
	einfo "a host to load the VST."
	einfo "The only free host so far is JOST. You can emerge it as"
	einfo "media-sound/jost"
	elog
}

EXPORT_FUNCTIONS pkg_postinst
