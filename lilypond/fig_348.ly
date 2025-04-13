\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r4 r8 f e f e' es d c a ais b d, f aes g f d dis e4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
