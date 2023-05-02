# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

MY_PN="${PN/-/}"
MY_P="${MY_PN}${PV}"
At="asiosdk_2.3.3_2019-06-14.zip"

DESCRIPTION="Steinberg ASIO SDK 2.3 - win32"
HOMEPAGE="http://www.steinberg.net/en/company/developer.html"
SRC_URI="${At}"

RESTRICT="fetch"

LICENSE="STEINBERG-EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
S="${WORKDIR}/ASIOSDK2"

pkg_nofetch() {
	einfo "1. Go to ${HOMEPAGE}"
	einfo "2. Create a developer login if you do not have one (this is required)"
	einfo "3. When you are logged in, click on the link for ASIO SDK"
	einfo "4. Agree to license terms and click on 'proceed to download'"
	einfo "5. move ${At} to /usr/portage/distfiles"
	einfo
}

src_unpack() {
	unpack "${At}" || die
}

src_install() {
	dodir "/opt/${MY_P}"
	mv ./* "${D}/opt/${MY_P}"
}

pkg_postinst() {
	echo
	elog "${P} has been installed to /opt/${MY_P}"
	elog "To re-read the license please refer to"
	elog "/opt/${MY_P}/Steinberg ASIO Licensing Agreement.pdf"
	echo
}
