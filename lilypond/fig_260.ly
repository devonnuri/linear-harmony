\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a1:m7 d:7
  }
  \new Staff \relative c' {
    e'8 c a g fis e d des c d e g b a fis a
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
