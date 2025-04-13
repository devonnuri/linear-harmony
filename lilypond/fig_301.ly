\version "2.25.25"

\include "layout.ly"

music = \relative c' {
r4 \tuplet 3/2 {g'16 a g} e8 fis d' r4
\tuplet 3/2 {g,16 a g} e8 fis d' r2
}

\score {
<<
  \chords {
    d1:7 r1
    g1:7 r1
    c1:7 r1
    f1:7 r1
  }
  \new Staff \relative c' {
    \music
  \transpose d g {\music}
  \transpose d c {\music}
  \transpose d f {\music}
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
