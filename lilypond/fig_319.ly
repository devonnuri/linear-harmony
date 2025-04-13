\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 a2:m7 d:7 g1:maj7
  }
  \new Staff \relative c' {
    e2 r8 g a b c b a g fis e' d c b2. d,4 g2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
