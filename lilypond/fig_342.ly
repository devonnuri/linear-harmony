\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 e' f g f e d c a b c a b a g f e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
