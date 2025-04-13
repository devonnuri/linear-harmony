\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    cis2:m7 fis:7 b1:maj7
  }
  \new Staff \relative c' {
    gis'8 e cis b ais cis e gis fis dis r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
