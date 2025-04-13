\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    g'4 es16 d c b~ b8 g' es b
    bes gis a ges' es e f4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
