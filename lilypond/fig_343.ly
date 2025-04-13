\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 e'8 g f cis e es d a c ais b d bes aes g f dis e~ e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
