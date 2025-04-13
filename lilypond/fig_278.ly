\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
  cis16 d e cis d e f g a f d a cis a' \tuplet 3/2 {f cis a} c! a b a' r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
