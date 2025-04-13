\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    r2 r8 a' f e d a c a b g' r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
