\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 b2:m7.5- e:7.9- a1:m
  }
  \new Staff \relative c' {
    e2 r4 d8 c b d f a gis f e d c4 e a gis a2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
