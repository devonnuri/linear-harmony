\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f
  }
  \relative {
    bes'8 d a c bes4 r
    \tuplet 3/2 {a8 bes a} g f e des c bes
    a4 r r2
    \bar "||"
  }
>>
