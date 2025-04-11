\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g2:m7 c:7 f1
  }
  \new Staff \relative {
    r2 r4 r8 bes''
    fis a g f e d c bes
    a4 r r2
    \bar "||"
  }
>>
