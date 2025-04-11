\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    r8 d16 f c d es f g bes d c r4
    r8 bes g gis a ges f es d r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
