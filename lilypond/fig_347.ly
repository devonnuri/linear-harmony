\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  g''8 ges \tuplet 3/2 {f a f} e es d a
\tuplet 3/2 {cis16 d cis} a8 c ais b aes g f e g b d c g a b~ b2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
