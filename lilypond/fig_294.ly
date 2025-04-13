\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 bes:7
  }
  \new Staff \relative c' {
    f8 c'~ c4 bes8 aes g f es c es cis d bes' r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
