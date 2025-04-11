\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a1:m7 d:7
  }
  \new Staff \relative c' {
    a'8 b c d e fis g b a g fis e d r r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
