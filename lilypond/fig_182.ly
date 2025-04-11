\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a1:m7 d:7
  }
  \new Staff \relative c' {
    r2 a'8 c e g fis e d des c4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
