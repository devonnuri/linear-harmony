\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
  \tuplet 3/2 {r8 g' bes} \tuplet 3/2 {c es g} bes4. g8
  gis a f fis g es c d f r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
