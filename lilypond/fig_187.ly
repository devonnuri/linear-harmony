\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    r2 r4 r8 g'~
    g16 bes d f e8 d c a e c
    g' e \tuplet 3/2 {f a c} e r r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
