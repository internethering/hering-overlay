# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit git-r3 systemd

DESCRIPTION="CalDAV Reminder Telegram Bot"
HOMEPAGE="https://github.com/mcdax/caldav-reminder-telegram-bot"
EGIT_REPO_URI="https://github.com/mcdax/caldav-reminder-telegram-bot.git"

LICENSE="GPL3"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT=""

RDEPEND="dev-python/markupsafe
	dev-python/jinja2
	dev-python/anyio
	dev-python/caldav
	dev-python/certifi
	dev-python/charset-normalizer
	dev-python/h11
	dev-python/httpcore
	dev-python/httpx
	dev-python/icalendar
	dev-python/idna
	dev-python/lxml
	dev-python/python-dateutil
	dev-python/python-dotenv
	dev-python/python-telegram-bot
	dev-python/pytz
	dev-python/recurring-ical-events
	dev-python/requests
	dev-python/six
	dev-python/sniffio
	dev-python/tzlocal
	dev-python/urllib3
	dev-python/vobject
	dev-python/x-wr-timezone"

src_install() {
	insinto /usr/share/caldav-reminder-telegram-bot
	doins "src/app.py"
	doins "src/template.example.html"

	insinto /etc
	newins .env.example caldav-reminder-telegram-bot.conf

	systemd_dounit "${FILESDIR}"/caldav-reminder-telegram-bot.service
}