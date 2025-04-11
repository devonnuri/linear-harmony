\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1.:m7 g2:7 c1:m7
  }
  \new Staff \relative c' {
    r2 d8 cis d e f g a c b d, f aes f fis g es d c r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
