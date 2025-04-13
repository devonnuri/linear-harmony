\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 f' e g f e d c b c b a g4 f8 e~ e1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
