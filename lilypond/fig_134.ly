\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    b1:m7.5- e:7 a:m7
  }
  \new Staff \relative c' {
    f'4. e16 es d8 c b a gis b, d e f gis b d c gis \tuplet 3/2 {b16 c b} g8 a e c r
    \bar "||"
  }
>>
