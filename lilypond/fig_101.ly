\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    bes1:m7 es:7 aes:maj7
  }
  \new Staff \relative c' {
    es'8 des f, aes c bes aes f
    g bes des es \tuplet 3/2 {e fis e} es des
    c4 r r2
    \bar "||"
  }
>>
