\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    d8 cis d e f e f g a gis a c b aes g f e1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
