\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    bes1:m7 es:7 aes:maj7
  }
  \new Staff \relative c' {
    r2 r4 r8 es'16 d
    des8 a bes aes g f \tuplet 3/2 {e16 f e} d8 es4 r r2
    \bar "||"
  }
>>
