\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    e'8 f e es d f \tuplet 3/2 {d des c} b4 r r2
    \bar "||"
  }
>>
