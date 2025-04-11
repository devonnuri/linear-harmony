\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2:m7 e:7 bes:m7 es:7
  }
  \new Staff \relative c' {
    r8 e'16 d cis b fis g gis e r8 r4
    r4 bes'16 c des es f aes g f es des c bes
    aes4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
