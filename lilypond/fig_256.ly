\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f1
  }
  \new Staff \relative c' {
    d'4 \tuplet 3/2 {bes8 g f} e des c bes a4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
