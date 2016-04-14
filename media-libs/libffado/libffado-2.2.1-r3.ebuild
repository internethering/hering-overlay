# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )
[[ "${PV}" = "9999" ]] && inherit subversion
inherit eutils python-single-r1 scons-utils toolchain-funcs udev multilib-minimal

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

LICENSE="GPL-2"
SLOT="0"
IUSE="debug qt4 +test-programs"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="dev-cpp/libxmlpp[${MULTILIB_USEDEP}]
	dev-libs/dbus-c++
	dev-libs/libconfig[cxx,${MULTILIB_USEDEP}]
	media-libs/alsa-lib
	media-libs/libiec61883[${MULTILIB_USEDEP}]
	media-sound/jack-audio-connection-kit[${MULTILIB_USEDEP}]
	sys-apps/dbus
	sys-libs/libraw1394[${MULTILIB_USEDEP}]
	sys-libs/libavc1394[${MULTILIB_USEDEP}]
	${PYTHON_DEPS}
	qt4? (
		dev-python/PyQt4[dbus,${PYTHON_USEDEP}]
		dev-python/dbus-python[${PYTHON_USEDEP}]
		x11-misc/xdg-utils
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${P}-flags.patch
	"${FILESDIR}"/${P}-jack-detect.patch
	"${FILESDIR}"/${P}-detect-userspace-env.patch
	"${FILESDIR}"/${P}-mixer.patch
)

multilib_native_use_scons() {
	if multilib_is_native_abi; then
		use_scons "${@}"
	else
		echo "${2:-${1}}=${4:-${USE_SCONS_FALSE}}"
	fi
}

myescons() {
	myesconsargs=(
		PREFIX="${EPREFIX}/usr"
		LIBDIR="${EPREFIX}/usr/$(get_libdir)"
		MANDIR="${EPREFIX}/usr/share/man"
		UDEVDIR="$(get_udevdir)/rules.d"
		CUSTOM_ENV=True
		DETECT_USERSPACE_ENV=False
		$(use_scons debug DEBUG)
		$(multilib_native_use_scons qt4 BUILD_MIXER true false)
		$(multilib_native_use_scons test-programs BUILD_TESTS)
		# ENABLE_OPTIMIZATIONS detects cpu type and sets flags accordingly
		# -fomit-frame-pointer is added also which can cripple debugging.
		# we set flags from portage instead
		ENABLE_OPTIMIZATIONS=False
	)
	escons "${@}"
}

src_unpack() {
	if [ "${PV}" = "9999" ]; then
		subversion_src_unpack
	else
		default
	fi
}

src_prepare() {
	[[ ${PATCHES[@]} ]] && epatch "${PATCHES[@]}"
	multilib_copy_sources
}

multilib_src_configure() {
	: # no-op
}

multilib_src_compile () {
	tc-export CC CXX
	myescons
}

multilib_src_install () {
	myescons DESTDIR="${D}" WILL_DEAL_WITH_XDG_MYSELF="True" install
}

multilib_src_install_all() {
	einstalldocs

	python_fix_shebang "${D}"
	python_optimize "${D}"

	if use qt4; then
		newicon "support/xdg/hi64-apps-ffado.png" "ffado.png"
		newmenu "support/xdg/ffado.org-ffadomixer.desktop" "ffado-mixer.desktop"
	fi
}
