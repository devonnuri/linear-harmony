\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    aes2:m7 des:7 fis:m7 b:7
  }
  \new Staff \relative c' {
    es4 ges8 es f des' r b,!
    cis4 e8 cis dis b' r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
