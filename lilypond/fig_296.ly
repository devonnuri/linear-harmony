\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:m7 bes:7
  }
  \new Staff \relative c' {
    f'4 c16 aes g f es g f es d4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
