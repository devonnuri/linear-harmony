\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1:maj7
    d2:m7 g:7 c1:maj7
    d2:m7 g:7 c1:maj7
    d2:m7 g:7 c1:maj7
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      f'8 e d c b a g f e1
      d8 f a c b a g f e1 \break
      a8 f d c b d f a g1
      f8 e' d c b a' g f e1
    }
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
