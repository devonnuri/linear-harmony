\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
    bes'4 g8 es c es g bes
  d c \tuplet 3/2 {cis16 d cis} a8 aes4 ges8 aes
  f4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
