\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  d8 cis d f \tuplet 3/2 {e f a} c ais b4 a8 aes r g' f e~ e2 r8 g, a b
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
