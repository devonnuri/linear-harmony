\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 a'8 gis a4 g8 f e d cis e d4 c8 a b a'4 g8~ g4 f8 dis e g f e
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
