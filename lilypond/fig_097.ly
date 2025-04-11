\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
    es8 f g bes d c g bes 
    \tuplet 3/2 {a16 bes a} g8 aes g ges bes f es
    d r r4 r2
    \bar "||"
  }
>>
