\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes:maj7
  }
  \new Staff \relative c' {
    c4 d es f8 g~
    g4 bes8 a~ a4 f8 d~
    d4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
