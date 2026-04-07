# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd tmpfiles

DESCRIPTION="workflow automation tool. Easily automate tasks across different services."
HOMEPAGE="https://n8n.io/"
SRC_URI="https://registry.npmjs.org/${PN}/-/${P}.tgz"
S="${WORKDIR}/package"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="network-sandbox"

RDEPEND="
	net-libs/nodejs
	net-misc/curl
	acct-group/${PN}
	acct-user/${PN}
"
BDEPEND="
	net-libs/nodejs[npm]
"

src_compile() {
	# Skip, nothing to compile here.
	:
}

src_install() {
	local -a myopts=(
    	--audit false
        --color false
        --foreground-scripts
        --global
        --omit dev
        --prefix "${ED}/usr"
        --progress false
        --verbose
    )
	npm "${myopts[@]}" install "${DISTDIR}/${P}.tgz" || die "npm install failed"

	systemd_dounit "${FILESDIR}"/n8n.service
	systemd_newuserunit "${FILESDIR}"/n8n.user.service n8n.service
	newtmpfiles "${FILESDIR}"/n8n.tmpfiles n8n.conf
	insinto /etc/env.d
	newins "${FILESDIR}"/n8n.env 77n8n
}
