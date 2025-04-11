\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 e:m7 a:7
  }
  \new Staff \relative c' {
    r2 d'8 f a c~
    c a16 ais b8 g gis a f16 a f d
    g4 g8 f e d b c cis4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
