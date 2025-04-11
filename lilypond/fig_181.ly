\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:7
  }
  \new Staff \relative c' {
    d4~ d16 f a c b4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
