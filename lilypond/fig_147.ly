\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 aes2:m7 des:7 ges1
  }
  \new Staff \relative c' {
    r2 ces'4 g8 es bes'4 aes8 ges f a e d des r r4 r2
    \bar "||"
  }
>>
