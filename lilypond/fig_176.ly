\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    cis1:m7 fis:7
  }
  \new Staff \relative c' {
    r4 cis cis8 e gis b ais4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
