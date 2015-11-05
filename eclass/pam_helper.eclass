# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Original Author: Frieder Buerzele <evermind@tuxfamily.org>
# Purpose: Display msg after install and add realtime settings to
#		/etc/security/limits.conf
#

ECLASS="pam_helper"

inherit pam

add_rt_limits() {
cat << EOT >> "${S}/modules/pam_limits/limits.conf"

# REALTIME support for audio group users
@audio          -       rtprio          100
@audio          -       nice            -10
@audio          -       memlock         250000
EOT
}

pam_helper_pkg_postinst() {
	elog
	elog "Please edit file /etc/security/limits.conf"
	elog "and change this settings to suit your needs"
	elog
	elog "@audio          -       rtprio          100"
	elog "@audio          -       nice            -10"
	elog "@audio          -       memlock         250000"
	elog
}
EXPORT_FUNCTIONS pkg_postinst
