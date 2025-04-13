\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    d8 f e d f a c cis e es d c a ais b aes g d dis f e ais, b d c2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
