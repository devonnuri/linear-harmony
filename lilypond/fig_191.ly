\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r2 d:m7.5- g1:7
  }
  \new Staff \relative c' {
    r2 d8 f aes c
    b2~ b8 d r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
