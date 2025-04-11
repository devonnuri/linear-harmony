\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:m7 bes:7 es:m7 aes:7 des:maj7
  }
  \new Staff \relative c' {
  \tuplet 3/2 {f8\startGroup aes c} es c d\stopGroup bes \tuplet 3/2 {aes16 bes aes} e8
es4\startGroup \tuplet 3/2 {ges8 bes des} c bes \tuplet 3/2 {aes16 bes aes} ges8
f\stopGroup r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
