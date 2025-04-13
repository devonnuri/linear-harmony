\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    e2 r4 a8 fis g bes d f e d c bes a4 f8 a g f e g f2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
