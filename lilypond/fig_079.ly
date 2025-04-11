\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7.5- c:7.9- f:m7
  }
  \new Staff \relative c' {
    r2 \tuplet 3/2 {c'8 des c} bes aes
    g f e g, bes des c bes aes r r4 r2
    \bar "||"
  }
>>
