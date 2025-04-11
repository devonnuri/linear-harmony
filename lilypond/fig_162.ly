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
    c2:m7 f:7 bes:maj7 g4..:7 c8:m7
  }
  \new Staff \relative c' {
    % es'8^"↓" d c es^"↓" d^"↓" c^"↓" b g_"↑"
    % bes^"↓" gis_"↑" a^"↓"_"↑" ges^"↓" es e f^"↓" a,_"↑"
    % bes_"↑" es^"↓" c_"↑" cis_"↑" d4^"↓"_"↑" r
    es'16^"↓" g, gis a d^"↓" des c^"↓" bes^"↓"
    g gis a^"↓" c, es ges^"↓" es e
    f^"↓" es^"↓" c cis d^"↓" c^"↓" a ais
    b^"↓" aes'^"↓" f fis g^"↓" d f^"↓" es^"↓"
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
