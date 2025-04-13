\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c
  }
  \new Staff \relative c' {
    a'2 d,4 a' f4. d8 c4 b g'4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
