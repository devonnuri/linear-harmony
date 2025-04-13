\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7 d
  }
  \new Staff \relative c' {
    e8 g b dis, g b d, g b g e d cis e g bes a fis r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
