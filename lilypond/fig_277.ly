\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:7 d2:m7 g:7 c1
  }
  \new Staff \relative c' {
    r8 f' e es d f a f d a cis a c a b a' g4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
