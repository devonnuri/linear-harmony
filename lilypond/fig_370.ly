\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 d f g a f e d a' f d c b a' f fis g e d c g' e f g
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
