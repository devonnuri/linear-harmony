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
    a'8 f d a cis16 d cis a c d c a b8 g'4.
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
