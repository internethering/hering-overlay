# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="MVZ"
inherit perl-module

DESCRIPTION="Read Outlook .msg files"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="dev-perl/Module-Build"

RDEPEND="
	dev-perl/Email-LocalDelivery
	dev-perl/Email-MIME
	dev-perl/Email-Sender
	dev-perl/IO-All
	dev-perl/IO-String
	dev-perl/OLE-StorageLite
	virtual/perl-Getopt-Long
	dev-perl/Pod-Parser"

DEPEND="${RDEPEND}"

SRC_TEST=do
