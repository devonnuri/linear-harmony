\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2:m7 e:7 a1:m7 d:7 g:maj7
  }
  \new Staff \relative c' {
    d'8\startGroup c b a \tuplet 3/2 {gis16 a gis} f8 \tuplet 3/2 {e16 f e} d8 c\stopGroup
  c'\startGroup \tuplet 3/2 {b16 c b} a8 gis b a g fis a, c d \tuplet 3/2 {es f es} d c b\stopGroup r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
