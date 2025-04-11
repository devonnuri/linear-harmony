\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    cis2:m7 fis:7 b1
  }
  \new Staff \relative c' {
    cis8 dis e fis gis b ais gis fis2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
