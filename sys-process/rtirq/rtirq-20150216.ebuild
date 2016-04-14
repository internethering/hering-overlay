# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"
DESCRIPTION="Change realtime sched policy & priority of relevant system driver IRQ handlers"
HOMEPAGE="http://www.rncbc.org/jack/"

SRC_URI="http://www.rncbc.org/jack/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=">=sys-apps/util-linux-2.13
	sys-apps/sysvinit"

src_prepare() {
	# set path for cfg file
	sed -ie "s:^\(RTIRQ_CONFIG\=\)\(.*\):\1/etc/conf.d/rtirq:" rtirq.sh

	# cfg path
	sed -i -e "s:/etc/sysconfig/rtirq:/etc/conf.d/rtirq:" rtirq.conf

	# fixup to work with different kernels
	# see http://article.gmane.org/gmane.linux.gentoo.proaudio/2497
	sed -i -e 's@\(egrep.*\)softirq\(.*\)@\1s(oft)?irq\2@g' rtirq.sh
}

src_install(){
	mv rtirq.sh rtirq
	exeinto /etc/init.d
	doexe rtirq
	insinto /usr/lib/systemd/system
	doins rtirq.service
	insinto /etc/conf.d
	newins rtirq.conf rtirq
}

pkg_postinst(){
	elog "now add the script to your runlevel"
	elog "e.g. rc-update add rtirq default"
	elog "config-file: /etc/conf.d/rtirq"
	elog
	elog "You need an realtime-kernel to use this init-script:"
	elog "kernel-patch: https://www.kernel.org/pub/linux/kernel/projects/rt/"
	elog "select: (X) Complete Preemption (Real-Time) in kernel-config."
	elog "Easy way to get a realtime kernel try:"
	elog "emerge rt-sources"
	elog
	elog "To display the status of the rtirq script use:"
	elog "/etc/init.d/rtirq status"
}
