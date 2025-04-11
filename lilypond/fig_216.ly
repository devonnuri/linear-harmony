\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    aes2:m7 des:7 ges1
  }
  \new Staff \relative c' {
    r4 r8 bes'16 g aes bes ces des es ges f8
    des4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
