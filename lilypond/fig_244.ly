\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7
  }
  \new Staff \relative c' {
    bes'8 d f dis e g d' c
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
