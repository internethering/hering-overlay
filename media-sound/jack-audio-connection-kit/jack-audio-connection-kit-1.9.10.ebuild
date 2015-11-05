# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# FIXME: Add [${MULTILIB_USEDEP}] to the libffado dependency when it
# has been migrated to multilib eclasses

EAPI="5"

PYTHON_COMPAT=( python2_7 )
[[ "${PV}" = "2.9999" ]] && inherit git-2
inherit eutils python-single-r1 waf-utils multilib-minimal

DESCRIPTION="Jackdmp jack implemention for multi-processor machine"
HOMEPAGE="http://jackaudio.org/"

RESTRICT="mirror"
if [[ "${PV}" = "2.9999" ]]; then
	EGIT_REPO_URI="git://github.com/jackaudio/jack2.git"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://dl.dropbox.com/u/28869550/jack-${PV}.tar.bz2"
	KEYWORDS="~amd64 ~ppc ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="alsa celt dbus debug doc ieee1394 opus pam"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="media-libs/libsamplerate[${MULTILIB_USEDEP}]
	>=media-libs/libsndfile-1.0.0[${MULTILIB_USEDEP}]
	${PYTHON_DEPS}
	alsa? ( media-libs/alsa-lib[${MULTILIB_USEDEP}] )
	celt? ( media-libs/celt[${MULTILIB_USEDEP}] )
	dbus? ( sys-apps/dbus[${MULTILIB_USEDEP}] )
	ieee1394? ( media-libs/libffado[${MULTILIB_USEDEP}] )
	opus? ( media-libs/opus[custom-modes,${MULTILIB_USEDEP}] )
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-soundlibs-20130224-r7
					!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( app-doc/doxygen )"
RDEPEND="${RDEPEND}
	dbus? ( dev-python/dbus-python[${PYTHON_USEDEP}] )
	pam? ( sys-auth/realtime-base )"

[[ "${PV}" = "2.9999" ]] || S="${WORKDIR}/jack-${PV}"

DOCS=( ChangeLog README README_NETJACK2 TODO )

src_unpack() {
	if [[ "${PV}" = "2.9999" ]]; then
		git-2_src_unpack
	else
		default
	fi
}

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_configure() {
	local mywafconfargs=(
		$(usex alsa --alsa "")
		$(usex dbus --dbus --classic)
		$(usex debug --debug "")
		$(usex ieee1394 --firewire "")
	)

	WAF_BINARY="${BUILD_DIR}"/waf waf-utils_src_configure \
		${mywafconfargs[@]}
}

multilib_src_compile() {
	WAF_BINARY="${BUILD_DIR}"/waf waf-utils_src_compile

	if multilib_is_native_abi && use doc; then
		doxygen || die "doxygen failed"
	fi
}

multilib_src_install() {
	multilib_is_native_abi && use doc && \
		HTML_DOCS=( "${BUILD_DIR}"/html/ )
	WAF_BINARY="${BUILD_DIR}"/waf waf-utils_src_install
}

multilib_src_install_all() {
	python_fix_shebang "${ED}"
}
