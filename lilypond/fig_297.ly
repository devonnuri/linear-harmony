\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a2:m7 d:7 g:m7
  }
  \new Staff \relative c' {
    e'8 d c bes a g fis a g4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
