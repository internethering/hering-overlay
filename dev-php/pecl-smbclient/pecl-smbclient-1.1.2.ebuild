# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PHP_EXT_NAME="smbclient"

USE_PHP="php8-3 php8-5"
inherit php-ext-pecl-r3

DESCRIPTION="A PHP wrapper for libsmbclient"
LICENSE="BSD 2-clause"
SLOT="7"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

RDEPEND="net-fs/samba"

DEPEND="${RDEPEND}"
