# ChordPro Implementation: Fonts

There are two ways to specify fonts: with a font filename, and a built-in font name.

A font filename must be either and absolute filename, or a relative filename which is interpreted relative to the _font path_, which consists of [[configuration setting|ChordPro Configuration]] `fontdir`, the `fonts` resource dir, and the contents of environment variable `FONTDIR`. In any case, the filename should point to a valid TrueType (`.ttf`) or OpenType
(`.otf`) font.

The ChordPro Reference Implementation supports the following built-in font names:

* Courier, Courier-Bold, Courier-BoldOblique, Courier-Oblique
* Georgia, Georgia-Bold, Georgia-BoldItalic, Georgia-Italic
* Helvetica, Helvetica-Bold, Helvetica-BoldOblique, Helvetica-Oblique
* Verdana, Verdana-Bold, Verdana-BoldItalic, Verdana-Italic
* Times-Roman, Times-Bold, Times-BoldItalic, Times-Italic 
* Symbol, Webdings, Wingdings, ZapfDingbats
