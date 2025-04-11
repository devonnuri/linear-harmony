\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d2:m7 g:7 c1
  }
  \new Staff \relative c' {
    f'16 a, c e dis32 e es d cis16 a c a b d \tuplet 3/2 {aes bes aes} g f e4 r r2
    \bar "||"
  }
>>
