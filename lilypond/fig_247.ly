\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1
  }
  \new Staff \relative c' {
    a'4 a8 c b4 b8 d c4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
