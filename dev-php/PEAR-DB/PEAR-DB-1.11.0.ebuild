# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit php-pear-r2

DESCRIPTION="Database abstraction layer for PHP"
LICENSE="PHP-3"
SLOT="0"
KEYWORDS="amd64 arm ppc64 sparc x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="test? ( dev-php/PEAR-PEAR )"

DOCS=( doc/TESTERS doc/IDEAS doc/MAINTAINERS doc/STATUS )

src_test() {
	# Requires the "pear" executable from dev-php/PEAR-PEAR, and also
	# a working version of the cli SAPI eselected.
	pear run-tests tests || die

	# The command succeeds regardless of whether or not the test suite
	# passed, but this file is only written when there was a failure.
	[[ -f run-tests.log ]] && die "test suite failed"
}
