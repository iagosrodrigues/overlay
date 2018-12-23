# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="A free-to-download Japanese font that combines the gothic kanji characters with mincho style hiragana and katakana"
HOMEPAGE="http://font.gloomy.jp/honoka-antique-kaku-dl.html"
SRC_URI="https://fontopo.com/fontdata/boku2b.zip"
S="${WORKDIR}/${PN}"
FONT_S="${WORKDIR}/${PN}"

LICENSE="OFL"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"
