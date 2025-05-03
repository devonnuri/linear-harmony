\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7
  }
  \new Staff \relative c' {
  g'4 \tuplet 3/2 {es8 c g} bes gis a f' \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
