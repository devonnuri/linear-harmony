\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g2:m7 c:7.9- f1
  }
  \new Staff \relative {
    r2 r4 r8 bes''
    r8 a g f e des c bes
    a c d f r2
    \bar "||"
  }
>>
