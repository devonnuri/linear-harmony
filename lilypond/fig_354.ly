\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f8 e d e f g a c b4 a8 b a g f d e4. g8 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
