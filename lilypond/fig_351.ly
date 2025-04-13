\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    f8 a c e8 d c r b~ b2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
