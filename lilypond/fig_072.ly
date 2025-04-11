\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g2:m7 c:7 f1
  }
  \new Staff \relative {
    \tuplet 3/2 {a'16 bes a} fis8 g f e g bes d c f, r4 r2
    \bar "||"
  }
>>
