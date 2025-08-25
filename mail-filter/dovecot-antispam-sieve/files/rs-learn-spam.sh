#!/bin/sh
. /etc/dovecot-antispam.conf
exec /usr/bin/rspamc -h /run/rspamd/worker-controller.socket -P ${secret} learn_spam