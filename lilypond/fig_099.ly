\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \time 3/4
    f2.:7 bes:m7 es:7
  }
  \new Staff \relative c' {
    \time 3/4
    a'8 c, es ges f es
    des4 r \tuplet 3/2 {c'8 bes aes}
    g4 r2
    \bar "||"
  }
>>
