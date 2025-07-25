# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID="282"
ACCT_USER_GROUPS=( "razorfy" )
ACCT_USER_HOME="/dev/null"
ACCT_USER_SHELL="/sbin/nologin"

acct-user_add_deps