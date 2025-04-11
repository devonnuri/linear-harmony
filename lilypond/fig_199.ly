\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7
  }
  \new Staff \relative c' {
    r8 fis \tuplet 3/2 {g bes d} f4^"↓" r
    \tuplet 3/2 {d8 dis e^"↓"}
    \tuplet 3/2 {c cis d^"↓"}
    \tuplet 3/2 {bes b c^"↓"}
    a g
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
