\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f'4 s s s b, s s s e, s s s
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
