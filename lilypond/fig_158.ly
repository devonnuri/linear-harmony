\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    e1:m7 a:7 d2:m7 g:7 d:m7 g:7
  }
  \new Staff \relative c' {
    a'4 fis8 a r b d dis
    fis dis e d cis b a aes
    g ges f g \tuplet 3/2 {a c e} g ges
    f e d c b g a r
    \bar "||"
  }
>>
