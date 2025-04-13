\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c
  }
  \new Staff \relative c' {
    d4 f a c8 b~ b4 a g f8 e~ e1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
