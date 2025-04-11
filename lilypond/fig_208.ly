\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2:m7 e:7
  }
  \new Staff \relative c' {
    b'8 cis d e fis16 a gis8 r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
