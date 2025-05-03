\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c:maj7 f:maj7 b:m7.5- e:7 a1:m
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      f8 e' d c b a g f e d' c b a g f e d c' b a gis f e d c2 r
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
