\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f'8 f e e d d c b~
    b b a a g g f e~ e4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
