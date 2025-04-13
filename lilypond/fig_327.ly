\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:maj7 fis2:m7.5- b:7.9- e1:m
  }
  \new Staff \relative c' {
    e2 r8 g a b c a fis e dis fis a c b2 g e r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
