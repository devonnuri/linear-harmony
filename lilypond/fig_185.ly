\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g2:m7 c:7
  }
  \new Staff \relative c' {
    r2 r4 r8 g'
    r bes d f \tuplet 3/2 {e4 d c}
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
