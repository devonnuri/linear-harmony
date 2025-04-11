\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7
  }
  \new Staff \relative c' {
    r4 r8 e~ e g b d
    r4 r8 cis r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
