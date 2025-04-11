\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    a1:m7.5- d:7
  }
  \new Staff \relative {
    \clef bass
    c'4 f,8 bes a4 g8 f
    fis a c es r2
    \bar "||"
  }
>>
