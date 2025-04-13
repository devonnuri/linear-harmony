\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 e2:m7.5- a:7.9- d1:m
  }
  \new Staff \relative c' {
    e2 c4 e8 f g f e d cis bes' a g f2 e d r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
