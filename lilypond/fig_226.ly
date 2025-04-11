\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
  f8 d\startGroup \tuplet 3/2 {f a c} b\stopGroup aes f4
  bes4 r8 bes, c\startGroup es g bes
  a c es ges es e f es
  d4\stopGroup r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
