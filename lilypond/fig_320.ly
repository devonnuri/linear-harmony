\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 b2:m7.5- e:7.9- a1:m
  }
  \new Staff \relative c' {
    e2 r8 g f e d c' b a gis f e d c2 b a r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
