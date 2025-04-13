\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    \set noChordSymbol = "A dorian"
    r1
  }
  \new Staff \relative c' {
    c'8 a b gis a fis g f fis4 a8 d,~ d4 des8 c~ c4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
