# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{10..15} )
inherit distutils-r1 pypi

DESCRIPTION="MurmurHash (MurmurHash3), a set of fast and robust hash functions"
HOMEPAGE="https://pypi.org/project/mmh3"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="lint type docs plot"

# TODO:
# lint: actionlint-py
# docs: shibuya

RDEPEND="
	lint? (
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-util/codespell
		llvm-core/clang
	)
	type? ( dev-python/mypy[${PYTHON_USEDEP}] )
	docs? (
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/sphinx-copybutton[${PYTHON_USEDEP}]
	)
	plot? (
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest