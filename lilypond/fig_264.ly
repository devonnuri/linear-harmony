\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g2.:m7 c4:7 f1:maj7
  }
  \new Staff \relative c' {
    r2 r4 r8 d'~
    d4 bes8 g f dis \tuplet 3/2 {e g bes}
    des8 b! c bes a4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
