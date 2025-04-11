\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative c' {
    es8 g f b, c d es f g bes g gis a c es g e! f d bes r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
