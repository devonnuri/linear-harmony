\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 fis2:m7.5- b:7.9- e1:m
  }
  \new Staff \relative c' {
    e2 r8 d' c b a g fis e dis c' b a g2 fis e r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
