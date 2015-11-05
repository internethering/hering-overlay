
# this eclass add support for ccache to a ardour SConstruct file
# maybe later this eclass should be more generic so other ebuild can easily use this to
# UPDATE: function add_ccache_to_scons_v2 is a more generic function 
# which adds ccache support to the end of SConstruct
add_ccache_to_scons() {
	MD5SUM="`md5sum < "SConstruct" 2>/dev/null`"
	ccache_to_scons
	local ret_val="$?"
	[ "${ret_val}" == "0" ] && [ "$MD5SUM" == "`md5sum < "SConstruct" 2>/dev/null`" ] &&  ret_val="2"
	[ "${ret_val}" == "2" ] &&  die "failed to add ccache support" ||\
	( [	"${ret_val}" == "0" ] && einfo "SConstruct patched" )
}

ccache_to_scons() {
	[ -n "${FEATURES}" -a -z "${FEATURES##*ccache*}" ] && ( sed  -i -e'/Audio\/MIDI\ library/'i"## Using ccache if possible\nif os.path.exists('/usr/lib/ccache/bin'):\n\tos.environ['PATH'] = '/usr/lib/ccache/bin:' + os.environ['PATH']\n\tenv['ENV']['CCACHE_DIR'] =	os.environ['CCACHE_DIR']\n" SConstruct &>/dev/null && return "0" || return "2" )
}

add_ccache_to_scons_v2() {
	local sconscript_file="$1"
	[ "${#sconscript_file}" == "0" ] && sconscript_file="SConstruct"
if [ -n "${FEATURES}" -a -z "${FEATURES##*ccache*}" ];then
	cat >>"${sconscript_file}" <<EOF
## Using ccache if possible
if '/usr/lib/ccache/bin' in os.environ['PATH'] and os.environ.has_key('CCACHE_DIR') and os.path.exists('/usr/lib/ccache/bin'):
	print('Using ccache')
	os.environ['PATH'] = '/usr/lib/ccache/bin:' + os.environ['PATH']
	env['ENV']['CCACHE_DIR'] = os.environ['CCACHE_DIR']
	env['ENV']['PATH'] = os.environ['PATH']
	env['ENV']['HOME'] = os.environ['HOME']
EOF
fi
}

