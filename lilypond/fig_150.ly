\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 c:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    r2 r4 r8 es'~
    es4 g16 es d c b8 d r c~
    c4 g8 bes a ges f es d4 r r2
    \bar "||"
  }
>>
