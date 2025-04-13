\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 e2:m7.5- a:7.9- d1:m
  }
  \new Staff \relative c' {
    e2 r4 g8 a bes g e d cis e g bes a2 f d r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
