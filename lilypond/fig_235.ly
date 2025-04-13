\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c1:maj7
  }
  \new Staff \relative c' {
  c'8 a f d \tuplet 3/2 {b'16 c b} a8 g f
  e g d b c r r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
