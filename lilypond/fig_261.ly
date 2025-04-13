\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a1:m7.5- d:7.9- g:7
  }
  \new Staff \relative c' {
    es'4 d8 des c a a16 g8. fis8 a c d es f! d c b4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
