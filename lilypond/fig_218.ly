\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    es8 g, d' g, c d es f g bes d c g bes a r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
