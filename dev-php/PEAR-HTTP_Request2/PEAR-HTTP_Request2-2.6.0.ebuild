# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit php-pear-r2

DESCRIPTION="Provides an easy way to perform HTTP requests"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 arm ppc64 sparc x86"

RDEPEND=">=dev-php/PEAR-PEAR-1.10.1
dev-php/PEAR-Net_URL2"
