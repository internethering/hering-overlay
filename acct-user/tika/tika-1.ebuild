# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for tika server - content analysis"
ACCT_USER_ID=714
ACCT_USER_GROUPS=( tika )
ACCT_USER_HOME="/var/lib/tika"
ACCT_USER_SHELL="/bin/bash"

acct-user_add_deps
