\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g2:m7 c4.:7 f8
  }
  \new Staff \relative c' {
    r2 r4 r8 d'~
  d4 \tuplet 3/2 {bes8 g f} e d' des c
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
