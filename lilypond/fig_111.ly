\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    fis1:m7 b:7 e:maj7
  }
  \new Staff \relative c' {
    a'8 cis gis g fis e cis d
    dis fis a b \tuplet 3/2 {c d! c} b a
    fis g gis4 r2
    \bar "||"
  }
>>
