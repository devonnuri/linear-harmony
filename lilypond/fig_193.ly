\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c
  }
  \new Staff \relative c' {
    r4 r8 d g e \tuplet 3/2 {f a c}
    e4. d16 c b8 d f a g4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
