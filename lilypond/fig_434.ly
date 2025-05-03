\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2:m7.5- e:7 a1:m7
  }
  \new Staff \relative c' {
    d'4 c8 a b a gis b, d f e c d c r4 \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
