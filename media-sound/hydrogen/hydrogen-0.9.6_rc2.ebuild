# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit base cmake-utils versionator 

MY_P="${PN}-$(replace_version_separator '_' '-' ${PV^^})"

DESCRIPTION="Advanced drum machine"
HOMEPAGE="http://www.hydrogen-music.org"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip"

LICENSE="GPL-2 ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa +archive debug jack ladspa lash oss rubberband portaudio portmidi"

RDEPEND="dev-qt/qtgui:4
	dev-qt/qtcore:4
	archive? ( app-arch/libarchive )
	!archive? ( >=dev-libs/libtar-1.2.11-r3 )
	>=media-libs/libsndfile-1.0.18
	alsa? ( media-libs/alsa-lib )
	jack? ( media-sound/jack-audio-connection-kit )
	ladspa? ( media-libs/liblrdf )
	lash? ( virtual/liblash )
	portaudio? ( >=media-libs/portaudio-19_pre )
	portmidi? ( media-libs/portmidi )
	rubberband? ( media-libs/rubberband )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	app-arch/unzip"

S="${WORKDIR}/${MY_P}"
PATCHES=(
	"${FILESDIR}/${P}-lrdf.patch"
)

src_configure() {
    local mycmakeargs=(
		"-DSUSE=${MY_P}"
        $(cmake-utils_use_want jack JACK)
        $(cmake-utils_use_want alsa ALSA)
        $(cmake-utils_use_want ladspa LRDF)
        $(cmake-utils_use_want lash lash)
        $(cmake-utils_use_want archive LIBARCHIVE)
        $(cmake-utils_use_want oss OSS)
        $(cmake-utils_use_want portmidi PORTMIDI)
        $(cmake-utils_use_want portaudio PORTAUDIO)
        $(cmake-utils_use_want rubberband RUBBERBAND)
        $(cmake-utils_use_want debug DEBUG)
    )
	
	sed -i -e '/^FilePattern.*$/d' "${S}"/linux/hydrogen.desktop \
		|| die "Ouch"
	sed -i -e '/^FilePattern.*$/s!$!;!' "${S}"/linux/hydrogen.desktop \
		|| die "Ouch"
    
	cmake-utils_src_configure
}
