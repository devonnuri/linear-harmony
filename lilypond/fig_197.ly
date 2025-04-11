\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b1:m7 e:7
  }
  \new Staff \relative c' {
    gis'8 b, d fis a g gis b d f r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
