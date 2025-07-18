# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="CalDAV (RFC4791) client library for Python"
HOMEPAGE="
	https://github.com/python-caldav/caldav/
	https://pypi.org/project/caldav/
"

LICENSE="|| ( GPL-3 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/recurring-ical-events[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
"
