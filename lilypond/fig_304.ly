\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7.5- g:7 c1:m
  }
  \new Staff \relative c' {
    es'8 d16 c b8 d, f aes g f es r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
