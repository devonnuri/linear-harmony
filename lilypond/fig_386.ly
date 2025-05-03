\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e2:m7.5- a:7 d:m7 g:7 c1:maj7 f:7
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      g8 f' e d cis bes' a g f e' d c b aes' g f
    \tuplet 3/2 {e f fis} \tuplet 3/2 {g ges f} e d c b a b g es d c b a
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
