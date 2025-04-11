\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es2:m7 aes:7 des1:maj7
  }
  \new Staff \relative c' {
  es4. \tuplet 3/2 {ges16 bes des} c8 bes \tuplet 3/2 {aes16 bes aes} ges8
  f4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
