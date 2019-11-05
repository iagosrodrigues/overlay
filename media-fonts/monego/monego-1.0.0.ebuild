# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 font

DESCRIPTION="The beloved Monaco monospaced font, recreated with a bold and italic variant. Finally."
HOMEPAGE="https://github.com/cseelus/monego"
EGIT_CLONE_TYPE="shallow"
EGIT_REPO_URI="https://github.com/cseelus/monego.git"
EGIT_CHECKOUT_DIR="${WORKDIR}"
FONT_S="${WORKDIR}/Monego"
FONT_SUFFIX="otf"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
