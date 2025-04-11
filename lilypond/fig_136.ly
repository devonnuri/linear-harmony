\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7 d:maj7
  }
  \new Staff \relative c' {
    r2 f'8 fis a aes g fis e d cis b a g fis4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
