# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit edo flag-o-matic toolchain-funcs

DESCRIPTION="SQLite extension for vector search (vec0 virtual table)"
HOMEPAGE="
	https://alexgarcia.xyz/sqlite-vec/
	https://github.com/asg017/sqlite-vec
"
SRC_URI="https://github.com/asg017/sqlite-vec/releases/download/v${PV}/${P}-amalgamation.tar.gz"
S="${WORKDIR}"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cpu_flags_x86_avx static-libs test"
RESTRICT="!test? ( test )"

DEPEND=">=dev-db/sqlite-3.38:3"
RDEPEND="${DEPEND}"
BDEPEND="test? ( >=dev-db/sqlite-3.38:3 )"

src_configure() {
	# Upstream wählt SIMD anhand von /proc/cpuinfo des Build-Hosts;
	# hier stattdessen über CPU_FLAGS bzw. die Architektur.
	if use cpu_flags_x86_avx; then
		append-cflags -mavx
		append-cppflags -DSQLITE_VEC_ENABLE_AVX
	fi
	# NEON ist auf AArch64 Baseline (der Code nutzt AArch64-only Intrinsics)
	use arm64 && append-cppflags -DSQLITE_VEC_ENABLE_NEON
}

src_compile() {
	local cc=$(tc-getCC)

	# Ladbare Extension (für .load vec0 / sqlite3_load_extension)
	edo ${cc} ${CPPFLAGS} ${CFLAGS} -fPIC -shared ${LDFLAGS} \
		-Wl,-soname,vec0.so \
		sqlite-vec.c -o vec0.so -lm

	if use static-libs; then
		edo ${cc} ${CPPFLAGS} ${CFLAGS} -DSQLITE_CORE -DSQLITE_VEC_STATIC \
			-c sqlite-vec.c -o sqlite-vec.o
		edo $(tc-getAR) rcs libsqlite_vec0.a sqlite-vec.o
	fi
}

src_test() {
	local out
	out=$(sqlite3 :memory: \
		".load ./vec0" \
		"select vec_version();" \
		"create virtual table t using vec0(e float[3]);" \
		"insert into t(rowid, e) values (1, '[1,0,0]'), (2, '[0,1,0]');" \
		"select rowid from t where e match '[0.9,0.1,0]' and k = 1;") \
		|| die "smoke test failed"
	einfo "${out//$'\n'/ }"
	[[ ${out} == "v${PV}"$'\n'"1" ]] || die "unexpected test output: ${out}"
}

src_install() {
	dolib.so vec0.so
	use static-libs && dolib.a libsqlite_vec0.a
	doheader sqlite-vec.h
}

pkg_postinst() {
	elog "Laden der Extension, z. B. in der sqlite3-Shell:"
	elog "    .load vec0"
	elog "oder per SQL: SELECT load_extension('vec0');"
}
