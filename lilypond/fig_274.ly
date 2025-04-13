\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 r4 bes2.:7
  }
  \new Staff \relative c' {
    f'4 <<aes8 c>> e, r <<aes8 c>> r es, r <<aes8 c>> d,2.
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
