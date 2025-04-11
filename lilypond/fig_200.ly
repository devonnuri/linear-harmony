\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  e'8 es d des c d, f a c d, f a \tuplet 3/2 {c d c} b g~ g4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
