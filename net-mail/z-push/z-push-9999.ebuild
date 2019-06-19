# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Z-Push syncs ActiveSync compatible devices against various backends"
HOMEPAGE="http://z-push.org/"
EGIT_REPO_URI="https://stash.z-hub.io/scm/zp/z-push.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="memcached ldap imap carddav caldav mysql postgres sqlite"

DEPEND=""
RDEPEND="dev-lang/php[cli,soap,posix]
	memcached? ( dev-php/pecl-memcached )
	!memcached? ( dev-lang/php[pcntl,sysvipc] )
	ldap? ( dev-lang/php[ldap] )
	imap? ( dev-lang/php[imap] )
	caldav? (
		dev-lang/php[curl]
		dev-php/awl
	)
	carddav? ( dev-lang/php[xslt,curl] )
	mysql? ( dev-lang/php[pdo,mysql] )
	postgres? ( dev-lang/php[pdo,postgres] )
	sqlite? ( dev-lang/php[pdo,sqlite] )"

process_cfg_file() {
	[ $(basename $(dirname ${1})) == "." ] && rn=${1} || rn=$(basename $(dirname ${1})).php

	insinto /etc/${PN}
	newins ${1} ${rn}
	rm ${1}
	dosym /etc/${PN}/${rn} usr/share/${PN}/${1}
}

process_doc_file() {
	[ $(basename $(dirname ${1})) == "." ] && dodoc ${1} || newdoc ${1} $(basename $(dirname ${1}))
	rm ${1}
}

src_install() {
	# process config files

	process_cfg_file policies.ini
	process_cfg_file config.php
	process_cfg_file autodiscover/config.php
	process_cfg_file tools/gab-sync/config.php
	for i in backend/*/config.php
	do
		process_cfg_file ${i}
	done

	# process documentation
	process_doc_file INSTALL z-push
	process_doc_file autodiscover/INSTALL
	for i in backend/*/README
	do
		process_doc_file ${i}
	done

	# install application to /usr/share
	insinto /usr/share/${PN}
	doins -r .

	# cli tools
	exeinto /usr/share/${PN}
	doexe z-push-*.php
	dosym ../share/${PN}/z-push-top.php usr/sbin/z-push-top
	dosym ../share/${PN}/z-push-admin.php usr/sbin/z-push-admin
}
