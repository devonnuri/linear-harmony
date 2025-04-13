\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    f4. e'8 d c r b~ b2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
