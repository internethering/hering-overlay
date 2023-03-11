# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd 

DESCRIPTION="RustDesk Client"
HOMEPAGE="https://rustdesk.com/"
SRC_URI="https://github.com/rustdesk/rustdesk/releases/download/nightly/rustdesk-1.2.0-0-x86_64.pkg.tar.zst -> ${P}.tar.zst"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="app-accessibility/at-spi2-atk
	app-accessibility/at-spi2-core
	app-arch/bzip2
	app-arch/lz4
	app-arch/xz-utils
	app-arch/zstd
	app-crypt/argon2
	app-crypt/libmd
	dev-libs/atk
	dev-libs/expat
	dev-libs/fribidi
	dev-libs/glib
	dev-libs/json-c
	dev-libs/libbsd
	dev-libs/libffi
	dev-libs/libgcrypt
	dev-libs/libgpg-error
	dev-libs/libpcre
	dev-libs/openssl
	dev-libs/wayland
	media-gfx/graphite2
	media-libs/flac
	media-libs/fontconfig
	media-libs/freetype
	media-libs/harfbuzz
	media-libs/libepoxy
	media-libs/libglvnd
	media-libs/libjpeg-turbo
	media-libs/libogg
	media-libs/libpng
	media-libs/libpulse
	media-libs/libsndfile
	media-libs/libvorbis
	media-libs/opus
	media-sound/lame
	media-sound/mpg123
	net-libs/libasyncns
	sys-apps/dbus
	sys-apps/systemd
	sys-apps/util-linux
	sys-devel/gcc
	sys-fs/cryptsetup
	sys-fs/lvm2
	sys-libs/glibc
	sys-libs/libcap
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	x11-misc/xdotool"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	# unpack doesn't work, this shit!
	#unpack ${P}.tar.zst || die "Cannot unpack!"
	cd ${WORKDIR}
	tar xvpf ${DISTDIR}/${P}.tar.zst
}

src_install() {
	# Install Library
	insinto /usr/lib
	doins -r usr/lib/rustdesk
	insinto usr/share/rustdesk
	doins -r usr/share/rustdesk/files

	# Install Symlink
	dosym /usr/lib/rustdesk/rustdesk /usr/bin/rustdesk
	fperms 0755 /usr/lib/rustdesk/rustdesk

	# desktop file + image
	insinto /usr/share/applications
	doins usr/share/rustdesk/files/rustdesk.desktop
	insinto /usr/share/icons/hicolor/256x256/apps
	doins usr/share/rustdesk/files/rustdesk.png

	# Install Systemd-Unit
	systemd_dounit usr/share/rustdesk/files/rustdesk.service
}
