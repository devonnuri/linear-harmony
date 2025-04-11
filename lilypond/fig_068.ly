\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g:m7 f1
  }
  \new Staff \relative {
    r2 r4 bes'8 d,
    a'4 g8 f e g bes d
    c a r4 r2
    \bar "||"
  }
>>
