\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    \clef bass
    r4 c,8 es g bes g gis a4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
