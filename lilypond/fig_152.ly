\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c2:m7 f:7 bes1:m
  }
  \new Staff \relative c' {
    \tuplet 3/2 {f'8 d es~} es16 d32 des c16 a~
    a [
    \set stemLeftBeamCount = 2
    \set stemRightBeamCount = 1
    aes'
    \set stemLeftBeamCount = 1
    \set stemRightBeamCount = 2
    \tuplet 3/2 {es des a}] aes ges f es des8 r r4 r2
    \bar "||"
  }
>>
