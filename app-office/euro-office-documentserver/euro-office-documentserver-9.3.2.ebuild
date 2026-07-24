# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Euro-Office DocumentServer"
HOMEPAGE="https://github.com/Euro-Office/DocumentServer"
#SRC_URI="https://github.com/Euro-Office/DocumentServer/releases/download/v${PV}/${PN}_${PV}-0_amd64.deb"
SRC_URI="https://github.com/Euro-Office/DocumentServer/releases/download/v${PV}/${PN}_9.3.1-dev.1_amd64.deb"

S="${WORKDIR}"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS=""

DEPEND="
	acct-group/ds
	acct-user/ds
	app-admin/supervisor
	dev-db/postgresql
	dev-db/redis
	media-fonts/corefonts
	net-misc/rabbitmq-server
	virtual/httpd-basic
"
RDEPEND="${DEPEND}"
BDEPEND=""

DIR="/var/www/euro-office/documentserver"
LOG_DIR="/var/log/euro-office/documentserver"
APP_DIR="/var/lib/euro-office/documentserver"
CONF_DIR="/etc/euro-office/documentserver"
DS_CONF=${CONF_DIR}/nginx/ds.conf

src_unpack(){
	unpack_deb ${A}
}

make_log_dirs() {
	local i
	dodir "${LOG_DIR}"
	for i in $@; do
		keepdir "${LOG_DIR}/documentserver/${i}"
	done
}

make_lib_dirs() {
	local i
	dodir "${APP_DIR}"
	for i in $@; do
		keepdir "${APP_DIR}/${i}"
	done
}

src_install() {
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/etc" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/var" "${D}" || die "install failed!"
	make_log_dirs adminpanel metrics converter docservice
	make_lib_dirs App_Data App_Data/cache/files App_Data/docbuilder
	keepdir "${DIR}/fonts"

	insinto "${CONF_DIR}"
	doins "${FILESDIR}/local.json"

	insinto "${CONF_DIR}/nginx"
	newins "${CONF_DIR}/nginx/ds.conf.tmpl" "ds.conf"

	fowners -R ds:ds "${DIR}"
	fowners -R ds:ds "${CONF_DIR}"
	fowners -R ds:ds "${APP_DIR}"
	fowners -R ds:ds "${LOG_DIR}/documentserver"
}

pkg_postinst() {
	ewarn "there is no official documentation how to setup DocumentServer without docker"
	ewarn "see https://github.com/Euro-Office/DocumentServer/issues/229"
	ewarn "have fun to find out yourself ;)"
	ewarn "maybe https://euro-office.github.io/documentation/installation/debian/ can help"
	ewarn "edit ${CONF_DIR}/local.json"
	ewarn "run:"
	ewarn "		documentserver-generate-allfonts.sh true"
	ewarn "		documentserver-flush-cache.sh -r false"
	ewarn "		documentserver-pluginsmanager.sh -r false --update=\"${DIR}/sdkjs-plugins/plugin-list-default.json\""
	ewarn "		documentserver-update-securelink.sh -s $(tr -dc A-Za-z0-9 </dev/urandom | head -c 20) -r false"

#	WOPI_PRIVATE_KEY="${CONF_DIR}/wopi_private.key"
#	WOPI_PUBLIC_KEY="${CONF_DIR}/wopi_public.key"
# openssl genpkey -algorithm RSA -outform PEM -out "${WOPI_PRIVATE_KEY}" >/dev/null 2>&1 && echo "Done"
# openssl rsa -RSAPublicKey_out -in "${WOPI_PRIVATE_KEY}" -outform "MS PUBLICKEYBLOB" -out "${WOPI_PUBLIC_KEY}" >/dev/null 2>&1  && echo "Done"

}
