\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    f'8 e d c b a gis a
    e' d a c b d f a g r r4 r2
    \bar "||"
  }
>>
