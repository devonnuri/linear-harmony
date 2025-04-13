\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r8 f g gis a4 e8 g f4 cis8 e d c a ais b d f a g4 dis8 f e b d c
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
