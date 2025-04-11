\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative c' {
    bes'8 aes f fis g f d dis
    \tuplet 3/2 {e f fis} \tuplet 3/2 {g gis a}
    \tuplet 3/2 {ais b c} \tuplet 3/2 {des c b}
    c4 r r2
    \bar "||"
  }
>>
