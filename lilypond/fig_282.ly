\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es1:m7 aes:7
  }
  \new Staff \relative c' {
  r8 \tuplet 3/2 {f'16 es des} bes8 ges es bes des bes c es r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
