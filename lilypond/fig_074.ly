\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d2:m7 g:7 c
  }
  \new Staff \relative c' {
    f8 e d c \tuplet 3/2 {b d f} aes bes16 aes g4 r r2
    \bar "||"
  }
>>
