\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 c2:m7 f:7
  }
  \new Staff \relative c' {
    r2 r4 g'8 es c g bes gis a4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
