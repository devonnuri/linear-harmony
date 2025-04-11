\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 e:m7 a:7 d1:m7
  }
  \new Staff \relative c' {
    f8 e d c b d f a g f e d cis bes' a e g f r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
