\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  f'8 e f e d4 c8 b~ b c b a \tuplet 3/2 {g a g} f e~ e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
