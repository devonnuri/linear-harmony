\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 a2:m7 d:7 g1:maj7
  }
  \new Staff \relative c' {
    e2 r8 b' c d e c a g fis a c e d2 b g r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
