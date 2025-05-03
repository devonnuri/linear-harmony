\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e2:m7 a:7 d:m7 g:7 c1:maj7 f:7
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      e8 g b d cis bes a g f d a' c b aes g f
      e g, a b d c b c es g a b~ b4 r8 g
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
