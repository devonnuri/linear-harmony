\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es1:m7 aes:7
  }
  \new Staff \relative c' {
    bes'8 a bes c des bes16 ges es8 c'~ c2 r \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
