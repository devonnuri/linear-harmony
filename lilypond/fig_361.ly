\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  a'8 f e d f a c b r d, f g \tuplet 3/2 {aes bes aes} g f e g r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
