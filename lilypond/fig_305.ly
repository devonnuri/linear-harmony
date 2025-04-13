\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2:m7 e:7
  }
  \new Staff \relative c' {
    e'8 d fis, a gis2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
