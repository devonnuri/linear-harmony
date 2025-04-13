\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    d8 f e d f a g f a f c' b~ b a g f e c d e f g f e~ e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
