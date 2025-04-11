\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e2:m7 a:7
  }
  \new Staff \relative c' {
    r4 e8 g b d cis b
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
