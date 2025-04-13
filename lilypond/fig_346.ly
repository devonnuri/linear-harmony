\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 f g gis a f e d cis a c ais b d f a g e r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
