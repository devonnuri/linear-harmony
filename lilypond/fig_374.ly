\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    a'8 gis a f e f d cis d des c ais b d f a g fis g dis f dis e c
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
