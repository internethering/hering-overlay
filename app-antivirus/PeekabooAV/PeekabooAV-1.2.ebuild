# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit distutils-r1

DESCRIPTION="Peekaboo Extended Email Attachment Behavior Observation Owl"
HOMEPAGE="https://github.com/scVENUS/PeekabooAV"

if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="https://github.com/scVENUS/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/scVENUS/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sqlalchemy
	>=dev-python/twisted-17.1
	>=dev-python/service_identity-16.0
	>=dev-python/python-magic-0.4.12
	dev-python/sdnotify
	dev-python/enum34
	dev-python/yara-python
	dev-python/oletools"
RDEPEND="${DEPEND}
	app-antivirus/cuckoo"
