\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    \set noChordSymbol = "G mixolydian"
    r2.
  }
  \new Staff \relative c' {
    \time 3/4
    r2 r8 a'
  \tuplet 3/2 {f d a} cis a c a b g' r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
