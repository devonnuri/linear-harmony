\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    bes2:m7 es:7
  }
  \new Staff \relative c' {
    es'16 d des a c b bes f \tuplet 3/2 {aes bes aes} f fis g4
    \bar "||"
  }
>>
