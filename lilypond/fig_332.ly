\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f'8 a g f e d c a b d c b a g f d e1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
