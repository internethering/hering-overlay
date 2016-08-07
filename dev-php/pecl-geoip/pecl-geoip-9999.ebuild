# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PHP_EXT_NAME="geoip"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="README ChangeLog"

USE_PHP="php7-0 php5-6 php5-5"

inherit subversion php-ext-pecl-r2

KEYWORDS=""

DESCRIPTION="PHP extension to map IP address to geographic places"
LICENSE="PHP-3"
SLOT="0"
IUSE=""

ESVN_REPO_URI="http://svn.php.net/repository/pecl/geoip/trunk/"
unset SRC_URI

DEPEND=">=dev-libs/geoip-1.4.0"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack

	local slot orig_s="${PHP_EXT_S}"
	for slot in $(php_get_slots); do
		cp -r "${orig_s}" "${WORKDIR}/${slot}" || die "Failed to copy source ${orig_s} to PHP target directory"
	done
}
