# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="A strong, neutral, principles-driven, open-source typeface for text or display"
HOMEPAGE="https://github.com/uswds/public-sans"
SRC_URI="https://github.com/uswds/public-sans/releases/download/v1.0.0/public-sans-v${PV}.zip"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""
S="${WORKDIR}/public-sans-v${PV}/fonts/otf"
FONT_S="${S}"

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="otf"
