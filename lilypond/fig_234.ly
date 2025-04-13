\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 c1:m7 f:7
  }
  \new Staff \relative c' {
    r2 r4 r8 c'
    r g4 c8 b g es c
    bes' g gis a r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
