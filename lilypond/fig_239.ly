\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7
  }
  \new Staff \relative c' {
    \clef "bass"
    fis,8 g bes g es c g' bes g gis a f r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
