\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    a1:m7 d:7
  }
  \new Staff \relative c' {
    r4 a'8 b c d e g gis b a g fis e d r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
