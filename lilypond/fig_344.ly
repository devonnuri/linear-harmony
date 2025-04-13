\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    dis'8 e g ges f c cis e d c a ais b d g, f e c' r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
