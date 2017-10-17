# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

[[ "${PV}" = "9999" ]] && inherit git-r3
inherit distutils-r1 user

DESCRIPTION="automated malware analysis system"
HOMEPAGE="https://github.com/cuckoosandbox/cuckoo"
if [[ "${PV}" = "9999" ]]; then
	EGIT_REPO_URI="git://github.com/cuckoosandbox/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/cuckoosandbox/${PN}/archive/${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/alembic
	app-antivirus/androguard
	dev-python/alembic
	>=dev-python/beautifulsoup-4.5.3
	dev-python/chardet
	dev-python/click
	dev-python/django
	dev-python/django-extensions
	>=dev-python/dpkt-1.8.7
	dev-python/elasticsearch-py
	dev-python/flask-sqlalchemy
	>=dev-python/flask-0.12.2
	dev-python/httreplay
	dev-python/jinja
	dev-python/oletools
	dev-python/pillow
	dev-python/pyelftools
	dev-python/pymongo
	dev-python/python-dateutil
	>=dev-python/python-magic-0.4.12
	dev-python/sqlalchemy
	dev-python/yara-python
	dev-python/pefile2
	dev-python/peepdf
	dev-python/egghatch
	dev-python/jsbeautifier
	dev-python/pymisp
	dev-python/SFlock
	dev-python/unicorn
	dev-python/wakeonlan"
RDEPEND="${DEPEND}"

src_prepare() {
	python2 stuff/monitor.py
}

pkg_setup() {
	enewuser cuckoo
}