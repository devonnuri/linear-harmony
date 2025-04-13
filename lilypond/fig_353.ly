\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 g''8 ges f a, c e d c a ais b d f g aes f g f e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
