\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es2:m7 aes:7
  }
  \new Staff \relative c' {
    r8. bes16 \tuplet 6/4 {es ges bes des bes b} c2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
