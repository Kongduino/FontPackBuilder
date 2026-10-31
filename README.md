# FontPackBuilder

A macOS app (Xojo) that builds **Meshtastic Font Packs** (`.mfp`): the glyphs of one font at one pixel size, for the
characters a device's built-in font doesn't have (Chinese, Japanese, Korean, Cantonese...). The format, the firmware
side and command-line tools are in [MeshtasticFontPacks](https://github.com/Kongduino/MeshtasticFontPacks).

- **Font:** GNU Unifont (16 px) or Fusion Pixel (12 px, Hong Kong forms), both bundled, or any `.ttf`/`.otf`/`.ttc`.
- **Characters:** named sets (GB2312, Big5, HKSCS, JIS X 0208, KS X 1001, kana...), Unicode blocks (with a filter),
  and hex ranges (`1000-109F, U+4E00`). The app counts the selected characters and those the font has.
- **Sizes:** 12 px, 16 px, or both (one pack each).
- **Glyph editor:** any glyph magnified, with its line box, baseline, pen and advance: draw, move, change the advance,
  revert to the font's. A character the font doesn't have can be drawn from scratch. Edits are kept across renders.
- **Packs** are written in format version 2, the same bytes as `mkfontpack.py` for the same font and characters.

Glyphs are drawn with CoreText, anti-aliasing and font smoothing off, which matches FreeType's mono rendering (the
Python generator's) pixel for pixel, but for a few accents that rise above the ascender line.

## Building

1. `Resources/Fonts/fetch_fonts.sh` downloads the two bundled fonts (their licences are in that folder).
2. Open `FontPackBuilder.xojo_project` in Xojo (2026r2 or later) and run or build it. A Copy Files build step puts
   `Resources/Blocks.txt`, `Resources/CharSets.txt` and `Resources/Fonts` in the app; run from the IDE, the app finds
   them next to the project.

`Resources/CharSets.txt` comes from MeshtasticFontPacks (`tools/export_sets.py`), so both tools select the same
characters; `Resources/Blocks.txt` is the Unicode Character Database's block list.

## Next

Uploading packs to a device (serial or TCP, through the MQTT_Xojo library), project files (font, selection, edits),
compressed transfers, Windows and Linux.

## Licence

GPL-3.0 (see `LICENSE`). The bundled fonts keep their own licences: Fusion Pixel Font (TakWolf) is OFL-1.1; GNU Unifont
is OFL-1.1 or GPL-2.0-or-later with the font embedding exception.
