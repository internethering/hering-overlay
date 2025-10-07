# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake prefix

DESCRIPTION="Front-End for ClamAV"
HOMEPAGE="https://www.pling.com/p/1127892/"
SRC_URI="https://github.com/wusel1007/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
    "${FILESDIR}/fix-installdir.patch"
    "${FILESDIR}/desktop.patch"
)

DEPEND="app-antivirus/clamav
    dev-qt/qtbase
    dev-qt/qtchooser"
RDEPEND="${DEPEND}"
BDEPEND=""