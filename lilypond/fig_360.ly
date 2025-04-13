\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f8 e d f a c a ais b g a aes g f d dis e4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
