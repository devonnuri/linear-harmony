\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d1:m7.5- g:7 c:maj7
  }
  \new Staff \relative c' {
    g'4 r r8 g'16 ges f es d c
    b a bes a aes g f es d c b d f aes g f
    e4 r r2
    \bar "||"
  }
>>
