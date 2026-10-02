# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="AI coding assistant skill – turn any folder into a queryable knowledge graph"
HOMEPAGE="https://www.headroomlabs.ai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mcp pdf watch svg google kimi ollama bedrock anthropic gemini openai \
 	sql pascal dm terraform ocaml commonlisp  vbnet r erlang solidity"

#    dev-libs/tree-sitter-groovy[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-kotlin[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-swift[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-zig[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-elixir[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-objc[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-verilog[${PYTHON_USEDEP}]
#    dev-libs/tree-sitter-fortran[${PYTHON_USEDEP}]
#   sql? ( dev-libs/tree-sitter-sql[${PYTHON_USEDEP}] )
#    pascal? ( dev-libs/tree-sitter-pascal[${PYTHON_USEDEP}] )
#    dm? ( dev-libs/tree-sitter-dm[${PYTHON_USEDEP}] )
#    terraform? ( dev-libs/tree-sitter-hcl[${PYTHON_USEDEP}] )
#    commonlisp? ( dev-libs/tree-sitter-commonlisp[${PYTHON_USEDEP}] )
#    vbnet? ( dev-libs/tree-sitter-vb-dotnet[${PYTHON_USEDEP}] )
#    r? ( dev-libs/tree-sitter-language-pack[${PYTHON_USEDEP}] )
#    solidity? ( dev-libs/tree-sitter-solidity[${PYTHON_USEDEP}] )"

RDEPEND="dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
    dev-python/rapidfuzz[${PYTHON_USEDEP}]
    dev-python/tomli[${PYTHON_USEDEP}]
    dev-python/tree-sitter[${PYTHON_USEDEP}]
    dev-libs/tree-sitter-python[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-javascript[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-typescript[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-go[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-rust[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-java[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-c[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-cpp[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-ruby[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-c-sharp[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-scala[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-php[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-lua[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-powershell[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-julia[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-bash[python,${PYTHON_USEDEP}]
    dev-libs/tree-sitter-json[python,${PYTHON_USEDEP}]
    mcp? (
        dev-python/mcp[${PYTHON_USEDEP}]
        dev-python/starlette[${PYTHON_USEDEP}]
    )
    pdf? (
        dev-python/pypdf[${PYTHON_USEDEP}]
        dev-python/markdownify[${PYTHON_USEDEP}]
    )
    watch? ( dev-python/watchdog[${PYTHON_USEDEP}] )
    svg? (
        dev-python/matplotlib[${PYTHON_USEDEP}]
        dev-python/pillow[${PYTHON_USEDEP}]
        dev-python/numpy[${PYTHON_USEDEP}]
    )

    google? ( dev-python/openpyxl[${PYTHON_USEDEP}] )

    kimi? (
        dev-python/openai[${PYTHON_USEDEP}]
        dev-python/tiktoken[${PYTHON_USEDEP}]
    )
    ollama? ( dev-python/openai[${PYTHON_USEDEP}] )
    bedrock? ( dev-python/boto3[${PYTHON_USEDEP}] )
    anthropic? ( dev-python/anthropic[${PYTHON_USEDEP}]
    )
    gemini? (
        dev-python/openai[${PYTHON_USEDEP}]
        dev-python/tiktoken[${PYTHON_USEDEP}]
    )
    openai? (
        dev-python/openai[${PYTHON_USEDEP}]
        dev-python/tiktoken[${PYTHON_USEDEP}]
    )

    ocaml? ( dev-libs/tree-sitter-ocaml[python,${PYTHON_USEDEP}] )
    erlang? ( dev-libs/tree-sitter-erlang[python,${PYTHON_USEDEP}] )"

BDEPEND=""