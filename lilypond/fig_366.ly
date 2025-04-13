\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  r4 r8 a \tuplet 3/2 {d f a} \tuplet 3/2 {c a ais}
  b d, f aes g b, d f e g r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
