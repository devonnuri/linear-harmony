\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    g'8 e f\startGroup es d c b d f\stopGroup aes f fis g\startGroup es c bes a c es ges\stopGroup es e f es d r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
