\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    cis2:m7 fis:7 b1
  }
  \new Staff \relative c' {
    cis8 e gis b ais4. gis8 fis4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
