\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f1
  }
  \new Staff \relative c' {
  r8 d'' \tuplet 3/2 {bes g f} e des c bes a2 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
