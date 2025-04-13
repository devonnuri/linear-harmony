\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    g''8 es b d16 b c g bes c a c, es f ges aes f8 r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
