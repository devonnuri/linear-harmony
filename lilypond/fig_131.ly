\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    f8 e es d'~ d4. \tuplet 3/2 {c16 bes gis} a8 es4. r2
    \bar "||"
  }
>>
