\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f1:7
  }
  \new Staff \relative c' {
    g'8 bes d f e b c d es r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
