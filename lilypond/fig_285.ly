\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f:m7 bes:7
  }
  \new Staff \relative c' {
    d4 g8 f e c'4^"↓" aes8^"↓" f^"↓" c es^"↓" cis d^"↓" bes' r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
