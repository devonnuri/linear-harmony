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
      f8 e d c b d f a g1
      d8 f a c b d f a g1 \break
      a,8 f d c b a' g f e1
      f8 e' d c b d, f a g1
    }
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
