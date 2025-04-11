\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f:maj7
  }
  \new Staff \relative c' {
    c'8 b \tuplet 3/2 {bes c bes} a g fis a g d f d e g bes d c a r4 r2
    \bar "||"
  }
>>
