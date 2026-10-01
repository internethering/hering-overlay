# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ast-grep-core@0.45.3
	ast-grep-config@0.45.3
	ast-grep-dynamic@0.45.3
	ast-grep-language@0.45.3
	ast-grep-lsp@0.45.3
	ast-grep-outline@0.45.3
	bit-set@0.11.0
	ignore@0.4.22
	regex@1.10.4
	serde@1.0.200
	serde_regex@1.2.0
	serde_yaml@0.9.33
	tree-sitter@0.27.0
	thiserror@2.0.0
	schemars@1.0.0
	anyhow@1.0.82
	dashmap@6.0.0
"

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..15} )

inherit distutils-r1 pypi cargo

DESCRIPTION="A CLI tool for code structural search, lint and rewriting. Written in Rust"
HOMEPAGE="https://ast-grep.github.io/"
SRC_URI="${SRC_URI}
	${CARGO_CRATE_URIS}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"