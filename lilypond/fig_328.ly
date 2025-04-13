\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    e2 r4 r8 c' d bes g f e g bes d c2 a f r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
