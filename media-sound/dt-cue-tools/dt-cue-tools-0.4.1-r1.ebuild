# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Library for cue sheet reading and tool for flac splitting using this information"
HOMEPAGE="https://github.com/iDarkTemplar/dt-cue-tools"

SRC_URI="https://github.com/iDarkTemplar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+tools"

DEPEND="
	"

RDEPEND="
	$DEPEND
	tools? (
		media-libs/flac:*
		media-sound/wavpack:*
		media-video/ffmpeg:*
		media-sound/mac:*
		media-sound/alac_decoder
	)"

src_configure() {
	local mycmakeargs=(
		-DENABLE_SPLIT_TOOL=$(usex tools)
	)

	cmake_src_configure
}
