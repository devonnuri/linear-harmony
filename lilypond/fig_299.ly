\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7 bes1
  }
  \new Staff \relative c' {
    r4 r8 g' f e es d c bes a c es g f es d4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
