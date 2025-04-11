\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    \accidentalStyle modern
    a''8 fis g es f d es bes
    b4 d8 b c bes a g f4 r r2
    \bar "||"
  }
>>
