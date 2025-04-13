\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    g'8 es d c b g bes g a c es g d c r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
