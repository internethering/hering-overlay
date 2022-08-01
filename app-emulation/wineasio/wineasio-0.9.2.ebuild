# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-minimal

DESCRIPTION="ASIO driver for WINE"
HOMEPAGE="https://sourceforge.net/projects/wineasio"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
LICENSE="GPL-2"
IUSE=""
SLOT="0"

DEPEND="media-libs/asio-sdk
	virtual/wine"
RDEPEND="virtual/jack[${MULTILIB_USEDEP}]"

S="${WORKDIR}/${PN}"

pkg_setup() {
	export WINETARGET=`eselect --brief --colour=no wine show | awk '{$1=$1;print}'`
	[[ $WINETARGET == "(unset)" ]] && die "please set wine version (eselect wine)"
}

src_prepare() {
	cp /opt/asiosdk2.3.1/asiosdk2.3.1\ svnrev312937/ASIOSDK2.3.1/common/asio.h .
	for i in Makefile*; do
		sed -i -e 's/lib32/lob32/g;s/lib/lib\/'"${WINETARGET}"'/g;s/lob32/lib32\/'"${WINETARGET}"'/g' $i
	done

	multilib_copy_sources
}

multilib_src_configure() {
	if has_multilib_profile && [[ ${ABI} == "amd64" ]] ; then
		mv Makefile64 Makefile
		./prepare_64bit_asio
	fi

	default
}

multilib_src_install() {
	exeinto /usr/$(get_libdir)/${WINETARGET}/wine
	doexe *.so
}

pkg_postinst() {
	echo
	elog "Finally the dll must be registered in the wineprefix."
	elog "For both 32 and 64 bit wine do:"
	elog "# regsvr32 wineasio.dll"
	elog
	elog "On a 64 bit system with wine supporting both 32 and 64 applications, regsrv32"
	elog "will register the 32 bit driver in a 64 bit prefix, use the following command"
	elog "to register the 64 bit driver in a 64 bit wineprefix:"
	elog
	elog "# wine64 regsvr32 wineaiso.dll"
	elog
	elog "regsvr32 registers the ASIO COM object in the default prefix "~/.wine"."
	elog "To use another prefix specify it explicitly, like:"
	elog "# env WINEPREFIX=~/asioapp regsvr32 wineasio.dll"
	echo
}
