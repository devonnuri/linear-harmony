\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative c' {
    g'8 e f d bes g c a bes c d f e g bes d c r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
