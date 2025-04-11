\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7 f:maj7
  }
  \new Staff \relative c' {
    r2 r8 fis8 \tuplet 3/2 {g\startGroup bes d}
    f \tuplet 3/2 {e16\stopGroup d c} bes8\startGroup a g f \tuplet 3/2 {e\stopGroup g bes}
    des16 es c8~ c16 bes c8 a g16 a f4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
