\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r8 d' e f~
    f4 e8 d r c r b~
    b4 c8 d b a g f e g r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
