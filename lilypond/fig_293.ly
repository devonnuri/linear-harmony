\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    r4 a''8^"↓" aes g ges f^"↓" a
    \tuplet 3/2 {e f e} d^"↓" c^"↓" b4^"↓" r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
