\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    aes2:m7 des:7 ges1
  }
  \new Staff \relative c' {
    ces'16 es, ges bes aes8. ges16 f8. es16 b! c b es
    des r8. r4 r2
    \bar "||"
  }
>>
