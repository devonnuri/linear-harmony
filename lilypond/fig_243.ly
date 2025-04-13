\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1:maj7
  }
  \new Staff \relative c' {
  r8 e' \tuplet 3/2 {f a c} b4. a8 g r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
