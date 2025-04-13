\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    a'4 f d c8 b~ b4 d f a8 g~ g1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
