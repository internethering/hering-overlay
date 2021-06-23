# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial

DESCRIPTION="unofficial modules for prosody"
HOMEPAGE="https://modules.prosody.im"
EHG_REPO_URI="https://hg.prosody.im/prosody-modules/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc"

DEPEND=""
RDEPEND=""

src_install() {
	list=( "mod_register_json" "mod_muc_log_http" "mod_incidents_handling" "mod_http_dir_listing" "mod_couchdb" "mod_auth_imap" "mod_auth_dovecot" "mod_admin_web" )
	for dir in "${list[@]}" ; do
		subdir=${dir#mod_}
		mv ${dir}/${subdir}/* ${dir}/
		rmdir ${dir}/${subdir}
	done

	for dir in mod*; do
		if [ -f "${dir}/README.markdown" ]; then
			if use doc ; then
				newdoc "${dir}/README.markdown" "${dir}.markdown"
			fi
			rm "${dir}/README.markdown"
		fi
	done

	mkdir -p "${D}/usr/lib/prosody-modules/"
	cp -R mod* "${D}/usr/lib/prosody-modules/" || die "Install failed!"
}

pkg_postinst() {
	elog "To be able to use the modules, please add to '/etc/jabber/prosody.cfg.lua':"
	elog "plugin_paths = { \"/usr/lib/prosody-modules\" }"
}
