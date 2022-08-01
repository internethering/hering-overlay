# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/hoehermann/purple-gowhatsapp"

EGO_VENDOR=(
	"github.com/Rhymen/go-whatsapp fcfd0abb9aa917ec702b30cda6794acc3f964273"
	"github.com/skip2/go-qrcode dc11ecdae0a9889dc81a343585516404e8dc6ead"
	"github.com/gorilla/websocket ae1634f6a98965ded3b8789c626cb4e0bd78c3de"
	"github.com/pkg/errors 27936f6d90f9c8e1145f11ed52ffffbfdb9e0af7"
	"github.com/golang/protobuf 4c88cc3f1a34ffade77b79abc53335d1e511f25b"
	"golang.org/x/crypto 60c769a6c58655dab1b9adac0d58967dd517cfba github.com/golang/crypto"
)

inherit golang-build golang-vcs-snapshot

ARCHIVE_URI="https://github.com/hoehermann/purple-gowhatsapp/archive/6d997ae16fdbb7213e5fe3d6fda07e46e70333a4.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"
KEYWORDS="amd64"

DESCRIPTION="A libpurple/Pidgin plugin for WhatsApp Web."
HOMEPAGE="https://github.com/hoehermann/purple-gowhatsapp"
SRC_URI="${ARCHIVE_URI}"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="net-im/pidgin
	dev-libs/glib"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	pushd src/${EGO_PN} || die
	eapply -p0 "${FILESDIR}/nofetch.patch"
	GOPATH="${S}" make || die
	popd || die
}

src_install()
{
	pushd src/${EGO_PN} || die
	insinto /usr/lib64/purple-2
	doins libgowhatsapp.so
	popd || die
}
