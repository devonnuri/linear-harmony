\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 fis2:m7.5- b:7.9- e1:m
  }
  \new Staff \relative c' {
    e2 r8 g a g fis a c e dis c b a g4 fis8 e fis4 e8 dis e2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
