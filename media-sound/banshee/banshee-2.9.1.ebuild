# Copyright open-overlay 2015 by Alex

EAPI=5
inherit eutils autotools mono gnome2-utils fdo-mime versionator gnome.org

DESCRIPTION="Import, organize, play, and share your music using a simple and powerful interface"
HOMEPAGE="http://banshee.fm/"
SRC_URI="http://gemmei.acc.umu.se/pub/GNOME/sources/banshee/2.9/banshee-2.9.1.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+aac +cdda +bpm daap doc +encode gconf gnome ipod karma mtp test udev upnp +web youtube"

RDEPEND="
	>=dev-lang/mono-3
	gnome-base/gnome-settings-daemon
	sys-apps/dbus
	dev-dotnet/gtk-sharp:3
	!dev-dotnet/gio-sharp
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	media-libs/gst-plugins-bad:1.0
	media-libs/gst-plugins-good:1.0
	media-libs/gst-plugins-ugly:1.0
	media-plugins/gst-plugins-meta:1.0
	cdda? (
		|| (
			media-plugins/gst-plugins-cdparanoia:1.0
			media-plugins/gst-plugins-cdio:1.0
		)
	)
	media-libs/musicbrainz:3
	dev-dotnet/dbus-sharp
	dev-dotnet/dbus-sharp-glib
	gconf? ( dev-dotnet/gconf-sharp )
	>=dev-dotnet/mono-addins-0.6.2
	>=dev-dotnet/taglib-sharp-2.0.3.7
	>=dev-db/sqlite-3.4:3
	karma? ( >=media-libs/libkarma-0.1.0-r1 )
	aac? ( media-plugins/gst-plugins-faad:1.0 )
	bpm? ( media-plugins/gst-plugins-soundtouch:1.0 )
	daap? (	>=dev-dotnet/mono-zeroconf-0.8.0-r1 )
	upnp? ( dev-dotnet/mono-upnp )
	doc? (
		>=app-text/gnome-doc-utils-0.17.3
	)
	encode? (
		media-plugins/gst-plugins-lame:1.0
		media-plugins/gst-plugins-taglib:1.0
	)
	ipod? ( >=media-libs/libgpod-0.8.2[mono] )
	mtp? (
		>=media-libs/libmtp-0.3.0
	)
	web? (
		>=net-libs/webkit-gtk-1.2.2:2
		>=net-libs/libsoup-gnome-2.26:2.4
	)
	youtube? (
		>=dev-dotnet/google-gdata-sharp-1.4
	)
	udev? (
		app-misc/media-player-info
		>=dev-dotnet/gudev-sharp-3.0
		dev-dotnet/gkeyfile-sharp
	)
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare () {
	DOCS="AUTHORS ChangeLog HACKING NEWS README"

	epatch "${FILESDIR}/fix-dll-configs.patch"
	epatch "${FILESDIR}/fix-empty-sourceview.patch"
	epatch "${FILESDIR}/use-dbus-2.patch"

	# Don't build BPM extension when not wanted
	if ! use bpm; then
		sed -i -e 's:Banshee.Bpm:$(NULL):g' src/Extensions/Makefile.am || die
	fi

	AT_M4DIR="-I build/m4/banshee -I build/m4/shamrock -I build/m4/shave" \
	eautoreconf
}

src_configure() {
	# soundmenu needs a properly maintained and updated indicate-sharp
	local myconf="--disable-dependency-tracking
		--disable-static
		--disable-maintainer-mode
		--with-gconf-schema-file-dir=/etc/gconf/schemas
		--with-vendor-build-id=Gentoo/${PN}/${PVR}
		--disable-boo
		--enable-gst-native
		--disable-gst-sharp
		--disable-torrent
		--disable-shave
		--disable-ubuntuone
		--disable-soundmenu
		--enable-release"

	econf \
		$(use_enable doc docs) \
		$(use_enable doc user-help) \
		$(use_enable mtp) \
		$(use_enable daap) \
		$(use_enable ipod appledevice) \
		$(use_enable gconf schemas-install) \
		$(use_enable gnome) \
		$(use_enable upnp) \
		$(use_enable karma) \
		$(use_enable web webkit) \
		$(use_enable youtube) \
		$(use_enable udev gio) \
		$(use_enable udev gio_hardware) \
		${myconf}
}

src_compile() {
	emake MCS=/usr/bin/dmcs
}

src_install() {
	default
	prune_libtool_files --all
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
