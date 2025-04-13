\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7 f:maj7
  }
  \new Staff \relative c' {
    f'4. d16 bes g8 f'4.~
    f8 d16 bes g8 f'~ f4 e8 d
    e4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
