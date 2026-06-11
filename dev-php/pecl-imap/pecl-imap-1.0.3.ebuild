# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PHP_EXT_NAME="imap"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
USE_PHP="php8-4 php8-5"

inherit php-ext-pecl-r3

DESCRIPTION="PHP IMAP protocol, as well as the NNTP, POP3, and local mailbox access methods"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
IUSE="+imap kerberos ssl"
REQUIRED_USE="ssl? ( imap )"

DEPEND="imap? ( net-libs/c-client[static-libs] )
	kerberos? ( virtual/krb5 )
	ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"

src_configure() {
	local PHP_EXT_ECONF_ARGS=( $(use_with kerberos) )
	if use imap; then
		PHP_EXT_ECONF_ARGS+=( --with-imap=/usr/include/imap )
	fi
	if use ssl; then
		PHP_EXT_ECONF_ARGS+=( --with-imap-ssl )
	fi
	php-ext-source-r3_src_configure
}

