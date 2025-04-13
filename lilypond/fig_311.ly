\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7 r
    d1:m7 g:7 c:maj7 r
    d1:m7 g:7 c:maj7 r
    d1:m7 g:7 c:maj7 r
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      f'4 e d c b a g f e1~ e \break
      d4 f a c b a g f e1~ e \break
      a4 f d c b d f a g1~ g \break
      f4 e' d c b a' g f e1~ e
    }
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
