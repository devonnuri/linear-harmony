\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e2:m7 a:7 d:m7 g:7 c1:maj7 f:7
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      b'8 g e d cis e g bes a f d c b d f aes g4 e8 c b c e g
    \tuplet 3/2 {b c cis} \tuplet 3/2 {d des c} b a g a
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
