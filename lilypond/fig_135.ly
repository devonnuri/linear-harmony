\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    r4 cis'8 d f e es g, bes d c bes a g f es d r r4 r2
    \bar "||"
  }
>>
