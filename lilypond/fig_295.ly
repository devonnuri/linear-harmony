\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7.5- bes:7
  }
  \new Staff \relative c' {
    bes'8 ces aes ges f4 es8 cis d4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
