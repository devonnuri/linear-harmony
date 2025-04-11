\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d2:m7 g:7 c1
  }
  \new Staff \relative c' {
    f'16 a, c f e d c ais \tuplet 6/4 {b d f aes bes g~}
    g f d dis \acciaccatura dis8 e4 r r2
    \bar "||"
  }
>>
