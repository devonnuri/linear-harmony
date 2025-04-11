\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es2:m7 aes:7
  }
  \new Staff \relative c' {
    es4 r aes16 f ges aes bes des c bes
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
