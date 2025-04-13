\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  r8 a \tuplet 3/2 {cis e cis} d f a c e d c ais b aes g f e g b d~ d4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
