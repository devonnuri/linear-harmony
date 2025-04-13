\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  r8 f \tuplet 3/2 {a c e} d c a ais 
  b d, f aes~ aes g f e~ e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
