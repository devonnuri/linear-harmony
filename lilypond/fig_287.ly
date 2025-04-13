\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    a'8 f d a c ais b g'~ g1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
