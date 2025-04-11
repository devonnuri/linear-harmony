\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \time 3/4
    c2.:m7.5- f:7 bes:m
  }
  \new Staff \relative c' {
    \time 3/4
    ges''8 f es des c bes a! c, es f ges f c4 es8 c des r
    \bar "||"
  }
>>
