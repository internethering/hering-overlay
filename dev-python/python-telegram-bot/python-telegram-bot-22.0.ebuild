# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( pypy3 python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="This library provides a pure Python, asynchronous interface for the Telegram Bot API"
HOMEPAGE="https://python-telegram-bot.org/"

LICENSE="LGPL3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/httpx[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
