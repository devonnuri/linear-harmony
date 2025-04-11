\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7
  }
  \new Staff \relative c' {
    r4 g'8 a bes c d f e4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
