\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7 a:m7
  }
  \new Staff \relative c' {
    r2 b'8 d cis b a g fis f e d cis e g b r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
