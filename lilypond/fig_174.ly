\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es2:m7 aes:7
  }
  \new Staff \relative c' {
    r4 es16 ges bes des c2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
