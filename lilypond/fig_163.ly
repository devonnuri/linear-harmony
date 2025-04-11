\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 6))
  }
}

\score {
<<
  \chords {
    c1:m7 bes2:maj7 g4..:7 c8:m
  }
  \new Staff \relative c' {
    \accidentalStyle default
    % es'16^"↓" g, gis a d^"↓" des c^"↓" bes^"↓"
    % g gis a^"↓" c, es ges^"↓" es e
    % f^"↓" es^"↓" c cis d^"↓" c^"↓" a ais
    % b^"↓" aes'^"↓" f fis g^"↓" d f^"↓" es^"↓"
    es'4^"↓" d8^"↓" c16^"↓" bes^"↓" r8 a^"↓" r16 ges8.^"↓"
    f16^"↓" es8.^"↓" d16^"↓" c8.^"↓" b!16^"↓" aes'8.^"↓" g8^"↓" f!16^"↓" es^"↓"
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
