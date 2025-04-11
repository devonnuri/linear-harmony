\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:m7 es:7
  }
  \new Staff \relative c' {
    r2 r4 f'8 e es d c bes a g f es
    des4 c'8 a bes e, f aes g f es d des4 r
    \bar "||"
  }
>>
