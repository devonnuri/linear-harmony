\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 bes''8 gis a dis, e g f cis e es d a c ais b aes g f' d dis e g, b d c b
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
