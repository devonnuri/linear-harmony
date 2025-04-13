\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    d8 cis d e f a c e d c a ais b f fis a g b, c f d dis e b d c r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
