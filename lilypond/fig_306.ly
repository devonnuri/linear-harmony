\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    \set noChordSymbol = "G dorian"
    r1
  }
  \new Staff \relative c' {
    a'8 bes fis a g d f dis e g bes d r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
