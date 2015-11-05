# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-libs/libffado/libffado-2.2.1.ebuild,v 1.1 2014/12/12 -tclover Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
[[ "${PV}" = "9999" ]] && inherit subversion
inherit base scons-utils eutils toolchain-funcs multilib-minimal python-single-r1 udev

DESCRIPTION="Successor for freebob: Library for accessing BeBoB IEEE1394 devices"
HOMEPAGE="http://www.ffado.org"

RESTRICT="mirror"
if [ "${PV}" = "9999" ]; then
	ESVN_REPO_URI="http://subversion.ffado.org/ffado/trunk/${PN}"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://www.ffado.org/files/${P}.tgz"
	KEYWORDS="~amd64 ~ppc ~x86"
fi

FIREWIRE_CARDS=( bebob fireworks oxford motu dice metric_halo rme digidesign bounce )
DEFAULT_CARDS=( bebob fireworks oxford motu dice rme )
for card in "${FIREWIRE_CARDS[@]}"; do
	has "${card}" "${DEFAULT_CARDS[@]}" "${FFADO_CARDS}" &&
		CARDS+=( +ffado_cards_${card} ) || CARDS+=( ffado_cards_${card} )
done

LICENSE="GPL-2"
SLOT="0"
IUSE="debug qt4 +test-programs ${CARDS[@]}"
REQUIRED_USE="${PYTHOH_REQUIRED_USE} || ( ${CARD[@]//+/} )"
unset CARDS

RDEPEND=">=dev-cpp/libxmlpp-2.6.13
	>=dev-libs/dbus-c++-0.9.0[${MULTILIB_USEDEP}]
	>=dev-libs/libconfig-1.4.8[${MULTILIB_USEDEP}]
	>=media-libs/alsa-lib-1.0.0[${MULTILIB_USEDEP}]
	>=media-libs/libiec61883-1.1.0[${MULTILIB_USEDEP}]
	>=sys-apps/dbus-1.0[${MULTILIB_USEDEP}]
	>=sys-libs/libraw1394-2.0.7[${MULTILIB_USEDEP}]
	>=sys-libs/libavc1394-0.5.3[${MULTILIB_USEDEP}]
	qt4? (
		dev-python/PyQt4[${PYTHON_USEDEP}]
		>=dev-python/dbus-python-0.83.0[${PYTHON_USEDEP}]
		${PYTHON_DEPS}
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog README )

if [ "${PV}" != "9999" ]; then
	PATCHES=(
		"${FILESDIR}"/${P}-flags.patch
		"${FILESDIR}"/${P}-jack-version.patch
	)
fi

src_prepare()
{
	base_src_prepare
	python_fix_shebang "${S}"
	multilib_copy_sources
}

src_unpack() {
	if [ "${PV}" = "9999" ]; then
        subversion_src_unpack
    else
        default
    fi
}

multilib_src_configure() {
	myesconsargs=(
		PREFIX="${EPREFIX}/usr"
		MANDIR="${EPREFIX}/usr/share/man"
		UDEVDIR="$(get_udevdir)/udev/rules.d"
		PYPKGDIR="${EPREFIX}/usr/$(get_libdir)/python2.7/site-packages/${PN}"
		CUSTOM_ENV=True
		$(use_scons debug DEBUG)
		$(use_scons test-programs BUILD_TESTS)
		# ENABLE_OPTIMIZATIONS detects cpu type and sets flags accordingly
		# -fomit-frame-pointer is added also which can cripple debugging.
		# we set flags from portage instead
		ENABLE_OPTIMIZATIONS=False
	)
	for card in "${FIREWIRE_CARDS[@]}"; do
		if use ffado_cards_${card} || has ${card} ${FFADO_CARDS}; then
			myesconsargs+=( "ENABLE_${card^^[a-z]}=${USE_SCONS_TRUE}" )
		else
			myesconsargs+=( "ENABLE_${card^^[a-z]}=${USE_SCONS_FALSE}" )
		fi
	done
	unset card
}

multilib_src_compile()
{
	tc-export CC CXX
	if has_multilib_profile && [[ ${ABI} == "x86" ]] ; then
		escons DIST_TARGET="i686" LIBDIR="${EPREFIX}/usr/$(get_libdir)"
	else
		escons DIST_TARGET="auto" LIBDIR="${EPREFIX}/usr/$(get_libdir)"
	fi
}

multilib_src_install()
{
	if has_multilib_profile && [[ ${ABI} == "x86" ]] ; then
		escons DIST_TARGET="i686" LIBDIR="${EPREFIX}/usr/$(get_libdir)" DESTDIR="${D}" WILL_DEAL_WITH_XDG_MYSELF="True" install
	else
		escons DIST_TARGET="auto" LIBDIR="${EPREFIX}/usr/$(get_libdir)" DESTDIR="${D}" WILL_DEAL_WITH_XDG_MYSELF="True" install
	fi
}

multilib_src_install_all()
{
	python_optimize "${D}"

	if use qt4; then
		newicon "support/xdg/hi64-apps-ffado.png" "ffado.png"
		newmenu "support/xdg/ffado.org-ffadomixer.desktop" "ffado-mixer.desktop"
	fi
}

