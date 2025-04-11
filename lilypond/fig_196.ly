\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a2:m7 d:7
  }
  \new Staff \relative c' {
  r8 gis' \tuplet 3/2 {a c e} g16 e f g fis4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
