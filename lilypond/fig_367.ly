\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    a'8 f g a f d e f d4 c8 a b a' g f g e f g e c d e~ e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
