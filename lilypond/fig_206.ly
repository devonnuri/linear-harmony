\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    r2 d'8 e f g a c b a g ges f e d4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
