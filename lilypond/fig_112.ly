\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    r2 r4 r8 f'16 e
    es8 d c bes a g f es
    d r r4 r2
    \bar "||"
  }
>>
