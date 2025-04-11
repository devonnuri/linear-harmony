\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c:m7 f:7 bes1
  }
  \new Staff \relative c' {
  \tuplet 3/2 {d8\startGroup f a} c ais b\stopGroup aes'4 g8~
  g\startGroup es c g bes gis a\stopGroup ges f4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
