\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative {
    g'8 a bes c \tuplet 3/2 {d f a} c b
    bes a g f e d c bes
    a c g e f2
    \bar "||"
  }
>>
