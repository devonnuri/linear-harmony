\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7
  }
  \new Staff \relative c' {
    r2 \tuplet 3/2 {fis'16 g fis} e8 d cis
    b a g fis e d cis e g b r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
