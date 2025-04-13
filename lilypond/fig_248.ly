\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1
  }
  \new Staff \relative c' {
    a'8 gis a c b ais b d c4 r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
