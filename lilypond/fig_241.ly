\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    aes1:m7 des:7 ges
  }
  \new Staff \relative c' {
  r2 \tuplet 3/2 {ges''8 aes ges} es ces
  aes ces es ges f es des ces bes r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
