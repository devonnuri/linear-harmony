\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \set Timing.measureLength = #3/4
    r4 c2:maj7
    \set Timing.measureLength = #4/4
    r2 c2:maj7
  }
  \relative {
    \set Timing.measureLength = #3/4
    d'8 dis e2
    \bar "||"
    \set Timing.measureLength = #4/4
    r8 f d dis e2
    \bar "||"
  }
>>
