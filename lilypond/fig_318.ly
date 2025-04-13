\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    e2 r4 g8 a bes a g f e d' c bes a2 g4 e f2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
