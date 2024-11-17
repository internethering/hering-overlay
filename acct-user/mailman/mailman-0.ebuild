# Copyright 2019-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID="280"
ACCT_USER_GROUPS=( "mailman" )
ACCT_USER_HOME="/var/lib/mailman"
ACCT_USER_SHELL="/bin/bash"

acct-user_add_deps
