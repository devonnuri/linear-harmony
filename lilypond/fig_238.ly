\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 cis:m7 c:m7 f:7 bes1
  }
  \new Staff \relative c' {
    c'8 a f d b'gis e cis
    bes' g es c a'4. g8 f4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
