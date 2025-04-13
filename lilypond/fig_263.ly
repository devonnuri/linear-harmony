\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g2:m7 c2:7 f1:maj7
  }
  \new Staff \relative c' {
    r2 r4 d'~
    d bes8 g f dis e g bes d c4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
