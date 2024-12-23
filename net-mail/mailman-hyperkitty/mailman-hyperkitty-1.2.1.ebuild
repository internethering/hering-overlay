# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=true
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Mailman archiver plugin which sends emails to HyperKitty"
HOMEPAGE="https://www.list.org"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"

BDEPEND="${RDEPEND}
	net-mail/mailman[${PYTHON_USEDEP}]"

DOCS=( README.rst )

python_install() {
	distutils-r1_python_install

	# ensure config are getting installed too
	insinto /etc/mailman.d
	newins "${S}/mailman-hyperkitty.cfg" hyperkitty.cfg
}
