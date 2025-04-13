\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f'8 e g e f e d c b d b a g b g f e1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
