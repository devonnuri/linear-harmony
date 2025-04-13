\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7
  }
  \new Staff \relative c' {
    f'8 g a f cis4 e8 cis
    d gis, a c b d bes a
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
