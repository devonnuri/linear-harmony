\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7.9- bes1:maj7
  }
  \new Staff \relative c' {
  g'8 es c bes a ges'16 f es8 e f es \tuplet 3/2 {d f a} c bes a bes d f~ f2 r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
