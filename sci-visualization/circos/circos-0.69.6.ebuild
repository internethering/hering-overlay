# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Circular layout visualization of genomic and other data"
HOMEPAGE="http://mkweb.bcgsc.ca/circos/"
MY_P="${PN}-$(ver_cut 1-2)-$(ver_cut 3)"
SRC_URI="http://mkweb.bcgsc.ca/circos/distribution/${MY_P}.tgz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="dev-perl/Config-General
	dev-perl/GD
	dev-perl/Math-Bezier
	dev-perl/Math-Round
	dev-perl/Math-VecStat
	dev-perl/Params-Validate
	dev-perl/Readonly
	dev-perl/Clone
	dev-perl/Font-TTF
	dev-perl/Text-Format
	dev-perl/Regexp-Common
	dev-perl/SVG
	dev-perl/Statistics-Basic
	>=dev-perl/Set-IntSpan-1.11
	dev-perl/Graphics-ColorObject
	dev-perl/List-MoreUtils"

src_install() {
	insinto /opt/${PN}
	find * -maxdepth 0 -type d | xargs doins -r
	exeinto /opt/${PN}/bin
	doexe bin/circos bin/gddiag
	dosym ../../../opt/${PN}/bin/circos usr/bin/circos
	find * -maxdepth 0 -type f | xargs dodoc
}
