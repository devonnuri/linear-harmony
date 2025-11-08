\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g2..:7 c8
  }
  \new Staff \relative c' {
    r8 g' c e f e c g dis' e c g f c' dis, e
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
