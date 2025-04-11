\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    c'8 d es b d c g bes
    \tuplet 3/2 {a bes b} c bes a g f es
    \tuplet 3/2 {d f a} c a bes f d4
    \bar "||"
  }
>>
