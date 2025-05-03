\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    g8 bes d bes f' dis e c'~ c a r4 r2 \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
