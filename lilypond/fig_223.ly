\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7 c:m7 f:7
  }
  \new Staff \relative c' {
    r4 c16 d es f g a bes c d b c^"↓" d es^"↓" f g^"↓" bes^"↓" a4^"↓" r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
