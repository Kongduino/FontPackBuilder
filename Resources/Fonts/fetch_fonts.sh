#!/bin/sh
# Downloads the two fonts FontPackBuilder bundles (both OFL-1.1; Unifont also GPL-2.0+ with the font embedding exception).
# Their licences are in this folder. Run once before building the app.
set -e
cd "$(dirname "$0")"
UNIFONT=18.0.01
FUSION=2026.10.25
curl -sfL -o "unifont-$UNIFONT.otf" "https://unifoundry.com/pub/unifont/unifont-$UNIFONT/font-builds/unifont-$UNIFONT.otf"
curl -sfL -o fusion.zip "https://github.com/TakWolf/fusion-pixel-font/releases/download/$FUSION/fusion-pixel-font-12px-proportional-ttf-v$FUSION.zip"
unzip -o -q -j fusion.zip "fusion-pixel-12px-proportional-zh_hk.ttf"
rm fusion.zip
ls -l *.otf *.ttf
