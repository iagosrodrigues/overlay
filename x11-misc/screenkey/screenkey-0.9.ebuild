# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
DISTUTILS_IN_SOURCE_BUILD=true

inherit distutils-r1

SHA1="c6d240a676d7a4df284e0010d0698e1f9c5fd44e"
DESCRIPTION="A screencast tool to display your keys inspired by Screenflick"
HOMEPAGE="https://gitlab.com/wavexx/screenkey"
SRC_URI="https://gitlab.com/wavexx/screenkey/-/archive/screenkey-0.9/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/python-distutils-extra[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	x11-misc/slop
	media-fonts/fontawesome
"
BDEPEND=""

S="${WORKDIR}/${PN}-${P}-${SHA1}"

src_prepare() {
	eapply "${FILESDIR}/${PV}/${P}-setup.patch"

	eapply_user
}
