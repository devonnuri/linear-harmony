\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g2:m7.5- c:7 f1:m
  }
  \new Staff \relative c' {
    r2 r4 c'8 b bes aes g f e des c bes
    aes4 r r2
    \bar "||"
  }
>>
