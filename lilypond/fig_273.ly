\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7
  }
  \new Staff \relative c' {
  r8 g'~ g bes16 d fis,4 \grace {g16 bes} d8 f,~
f [\grace {\stemDown g16 bes} \stemNeutral d8] e,2 r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
