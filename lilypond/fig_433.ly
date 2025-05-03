\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g2:m7 c:7 f1:maj7
  }
  \new Staff \relative c' {
    d'8 bes g f e g, bes d c a' r c,~ c4 r \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
