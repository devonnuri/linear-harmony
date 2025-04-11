\version "2.25.25"

chExceptionMusic = {
  <c e gis>-\markup { "+" }
  <c es ges>-\markup { \whiteCircleMarkup }
  <c es ges bes>-\markup {
    %%  f8 is o with slash.
    \super {#(ly:wide-char->utf-8 #x00f8) "7"}
  }
  <c es ges beses>-\markup \concat { \whiteCircleMarkup \super  "7" }
  <c e g b fis'>-\markup { \super "lyd" } % Lydian
  <c e g bes des' ees' fis' aes'>-\markup { \super "alt" } % altered chord (super-Locrian)
  %% Power chords should be printed by default:
  <c g>-\markup { \super "5" }
  <c g c'>-\markup { \super "5" }
}

chExceptions = #(sequential-music-to-chord-exceptions chExceptionMusic #t)

\header {
  tagline = #f
}

\paper {
  system-system-spacing.minimum-distance = 16
  property-defaults.fonts.serif = "Tex Gyre Termes"
  indent = 0.0
}

\layout {
  \context {
    \ChordNames
    chordNameExceptions = #chExceptions
    majorSevenSymbol = \markup { \whiteTriangleMarkup "7" }
    noChordSymbol = ""
    \override ChordName.font-name = #"Tex Gyre Termes" \override ChordName.font-size = 0.5
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 5))
    % \override ChordName.extra-offset = #'(0 . 1.7) % (X . Y)
  }
  \context {
    \Staff
    beamExceptions = #'()
    beatStructure = 1,1,1,1
  }
  \context {
    \Voice
    \consists Horizontal_bracket_engraver
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
    \override HorizontalBracket.thickness=2
  }
}
