\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:m7 bes:7 es1:maj7
  }
  \new Staff \relative c' {
  r8 aes' \tuplet 3/2 {c es ges} f es d ces
  bes4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
