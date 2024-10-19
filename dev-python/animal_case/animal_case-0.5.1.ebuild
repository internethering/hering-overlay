# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{8..13} python3_13t )
inherit distutils-r1 pypi

DESCRIPTION="The author of this package has not provided a project description"
HOMEPAGE="https://pypi.org/project/animal-case/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
