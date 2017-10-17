# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Hercules DJ Control MP3e2 translation daemon"
HOMEPAGE="https://github.com/nealey/hdjd"
EGIT_REPO_URI="https://github.com/nealey/hdjd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND=""

src_install()
{
	dobin hdjd
	ewbin explore hdjd-explore
}
