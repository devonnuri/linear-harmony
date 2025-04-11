\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    a1:m7 d:7 g:maj7
  }
  \new Staff \relative c' {
    c'8 a b gis a b c d c e g f fis e d c b r r4 r2
    \bar "||"
  }
>>
