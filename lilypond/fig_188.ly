\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 f2:m7 bes:7 es:maj7
  }
  \new Staff \relative c' {
    r2 r4 f,4~
  f8 \tuplet 3/2 {aes16 c es} c8 cis d c'4 bes8~
  bes1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
