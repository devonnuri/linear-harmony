\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es1:m7 aes:7
  }
  \new Staff \relative c' {
    bes'8 ges es bes des bes c es ges bes f es aes ges r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
