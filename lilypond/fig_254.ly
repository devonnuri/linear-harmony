\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a2:m7 d:7 g1
  }
  \new Staff \relative c' {
    e'8 c a g fis es d c b4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
