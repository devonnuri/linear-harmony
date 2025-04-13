\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 a' e g f a, e' es d a c ais b aes' g f e g, r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
