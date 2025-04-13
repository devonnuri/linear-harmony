\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7 d:m7 g:7 c
  }
  \new Staff \relative c' {
    e8\startGroup g b d b c cis\stopGroup e,
    g bes g gis a a, e' es\startGroup
    d a c a b\stopGroup d f g
  \tuplet 5/4 {gis16 a b\startGroup a aes} g8 f e\stopGroup g b d c4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
