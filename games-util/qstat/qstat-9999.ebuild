# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-util/qstat/qstat-2.11.ebuild,v 1.8 2008/10/04 14:51:42 ranger Exp $

EAPI=2

inherit subversion

DESCRIPTION="Server statics collector supporting many FPS games"
HOMEPAGE="http://www.qstat.org/"
ESVN_REPO_URI="https://qstat.svn.sourceforge.net/svnroot/qstat/trunk/qstat2"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~x86"
IUSE="debug"

DEPEND="!sys-cluster/torque"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	./autogen.sh || die
	econf $(use_enable debug) || die
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dosym qstat /usr/bin/quakestat

	dodoc CHANGES.txt COMPILE.txt template/README.txt
	dohtml template/*.html qstatdoc.html
}
