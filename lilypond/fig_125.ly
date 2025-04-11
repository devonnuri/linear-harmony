\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g:m7 c:7
  }
  \new Staff \relative c' {
    r2 r4 \tuplet 3/2 {c''8 b bes} a g f dis e d c b bes a g f e g bes c
    \bar "||"
  }
>>
