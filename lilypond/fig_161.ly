\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
    es'8^"↓" d c es^"↓" d^"↓" c^"↓" b g_"↑"
    bes^"↓" gis_"↑" a^"↓"_"↑" ges^"↓" es e f^"↓" a,_"↑"
    bes_"↑" es^"↓" c_"↑" cis_"↑" d4^"↓"_"↑" r
    \bar "||"
  }
>>
