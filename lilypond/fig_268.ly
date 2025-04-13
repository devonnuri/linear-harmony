\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    cis1:m7 fis:7 b:m7
  }
  \new Staff \relative c' {
    gis''4~ gis8 e16 cis bis4 cis
    r8 gis b gis ais gis fis e d r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
