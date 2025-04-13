\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7
  }
  \new Staff \relative c' {
    f'4 d bes8 g f' e~
    e2 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
