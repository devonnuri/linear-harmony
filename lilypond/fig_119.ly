\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    f'8 e es d c bes g gis a c, des f aes ges f es
    f4. d8~ d2
    \bar "||"
  }
>>
