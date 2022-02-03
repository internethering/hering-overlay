# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="ONLYOFFICE Document Server is a free collaborative online office suite"
HOMEPAGE="
	https://pypi.org/project/onlyoffice-docs-bin/
"
SRC_URI="https://github.com/ONLYOFFICE/DocumentServer/releases/download/v"${PV}"/onlyoffice-documentserver_amd64.deb -> "${P}"_amd64.deb"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="media-fonts/corefonts"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	doins -r etc
	doins -r lib
	doins -r usr
	doins -r var
	#fperms +x /opt/onlyoffice/desktopeditors/{DesktopEditors,editors_helper,converter/x2t}
}
