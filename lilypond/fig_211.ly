\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
    r4 r8 es'16 d c8 d es f g bes a g f g es d c bes r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
