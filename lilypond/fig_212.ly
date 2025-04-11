\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c
  }
  \new Staff \relative c' {
    d8 cis d e f g a c
    b d, f g \tuplet 3/2 {aes bes aes} g f 
    e4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
