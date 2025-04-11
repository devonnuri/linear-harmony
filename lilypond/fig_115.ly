\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 a2:m7 d:7 g1:m7
  }
  \new Staff \relative c' {
    r2 r4 r8 d'16 des
    c8 bes a g fis es d c bes c d f a g r4
    \bar "||"
  }
>>
