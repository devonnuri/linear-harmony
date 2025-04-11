\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c
  }
  \new Staff \relative c' {
    r4 r8 d \tuplet 3/2 {f a c} e d~
    d4 \tuplet 3/2 {c16 d c} a8 b aes f fis
    g4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
