\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    fis1:m7 b:7
  }
  \new Staff \relative c' {
    r4 gis'8 eis fis gis a b cis e cis d dis4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
