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
IUSE="mcp neo4j falkordb pdf watch svg leiden office google postgres video kimi ollama bedrock anthropic gemini openai \
 	chinese sql pascal dm terraform ocaml commonlisp robot vbnet r erlang solidity"

RDEPEND="dev-python/networkx[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
    dev-python/rapidfuzz[${PYTHON_USEDEP}]
    dev-python/tomli[${PYTHON_USEDEP}]
    dev-python/tree-sitter[${PYTHON_USEDEP}]
    dev-python/tree-sitter-python[${PYTHON_USEDEP}]
    dev-python/tree-sitter-javascript[${PYTHON_USEDEP}]
    dev-python/tree-sitter-typescript[${PYTHON_USEDEP}]
    dev-python/tree-sitter-go[${PYTHON_USEDEP}]
    dev-python/tree-sitter-rust[${PYTHON_USEDEP}]
    dev-python/tree-sitter-java[${PYTHON_USEDEP}]
    dev-python/tree-sitter-groovy[${PYTHON_USEDEP}]
    dev-python/tree-sitter-c[${PYTHON_USEDEP}]
    dev-python/tree-sitter-cpp[${PYTHON_USEDEP}]
    dev-python/tree-sitter-ruby[${PYTHON_USEDEP}]
    dev-python/tree-sitter-c-sharp[${PYTHON_USEDEP}]
    dev-python/tree-sitter-kotlin[${PYTHON_USEDEP}]
    dev-python/tree-sitter-scala[${PYTHON_USEDEP}]
    dev-python/tree-sitter-php[${PYTHON_USEDEP}]
    dev-python/tree-sitter-swift[${PYTHON_USEDEP}]
    dev-python/tree-sitter-lua[${PYTHON_USEDEP}]
    dev-python/tree-sitter-zig[${PYTHON_USEDEP}]
    dev-python/tree-sitter-powershell[${PYTHON_USEDEP}]
    dev-python/tree-sitter-elixir[${PYTHON_USEDEP}]
    dev-python/tree-sitter-objc[${PYTHON_USEDEP}]
    dev-python/tree-sitter-julia[${PYTHON_USEDEP}]
    dev-python/tree-sitter-verilog[${PYTHON_USEDEP}]
    dev-python/tree-sitter-fortran[${PYTHON_USEDEP}]
    dev-python/tree-sitter-bash[${PYTHON_USEDEP}]
    dev-python/tree-sitter-json[${PYTHON_USEDEP}]
        mcp? (
        dev-python/mcp[${PYTHON_USEDEP}]
        dev-python/starlette[${PYTHON_USEDEP}]
    )
    neo4j? ( dev-python/neo4j[${PYTHON_USEDEP}] )
    falkordb? ( dev-python/falkordb[${PYTHON_USEDEP}] )
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
    leiden? (
        dev-python/graspologic[${PYTHON_USEDEP}]
        dev-python/graspologic-native[${PYTHON_USEDEP}]
    )
    office? (
        dev-python/python-docx[${PYTHON_USEDEP}]
        dev-python/openpyxl[${PYTHON_USEDEP}]
    )
    google? ( dev-python/openpyxl[${PYTHON_USEDEP}] )
    postgres? (
        dev-python/psycopg[${PYTHON_USEDEP}]
        dev-python/tree-sitter-sql[${PYTHON_USEDEP}]
    )
    video? (
        dev-python/faster-whisper[${PYTHON_USEDEP}]
        dev-python/yt-dlp>=2026.7.4[${PYTHON_USEDEP}]
    )
    kimi? (
        dev-python/openai[${PYTHON_USEDEP}]
        dev-python/tiktoken[${PYTHON_USEDEP}]
    )
    ollama? ( dev-python/openai[${PYTHON_USEDEP}] )
    bedrock? ( dev-python/boto3[${PYTHON_USEDEP}] )
    anthropic? ( dev-python/anthropic[${PYTHON_USEDEP}]
    )
    gemini? || openai? (
        dev-python/openai[${PYTHON_USEDEP}]
        dev-python/tiktoken[${PYTHON_USEDEP}]
    )
    chinese? (
        dev-python/[${PYTHON_USEDEP}]
        dev-python/jieba-py[${PYTHON_USEDEP}]
    )
    sql? ( dev-python/tree-sitter-sql[${PYTHON_USEDEP}] )
    pascal? ( dev-python/tree-sitter-pascal[${PYTHON_USEDEP}] )
    dm? ( dev-python/tree-sitter-dm[${PYTHON_USEDEP}] )
    terraform? ( dev-python/tree-sitter-hcl[${PYTHON_USEDEP}] )
    ocaml? ( dev-python/tree-sitter-ocaml[${PYTHON_USEDEP}] )
    commonlisp? ( dev-python/tree-sitter-commonlisp[${PYTHON_USEDEP}] )
    robot? ( dev-python/robotframework[${PYTHON_USEDEP}] )
    vbnet? ( dev-python/tree-sitter-vb-dotnet[${PYTHON_USEDEP}] )
    r? ( dev-python/tree-sitter-language-pack[${PYTHON_USEDEP}] )
    erlang? ( dev-python/tree-sitter-language-pack[${PYTHON_USEDEP}] )
    solidity? ( dev-python/tree-sitter-solidity[${PYTHON_USEDEP}] )"

BDEPEND=""