\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 g2:m7 c:7
  }
  \relative {
    r2 r4 bes'8 a
    g f \tuplet 3/2 {e g bes} des r r4
    \bar "||"
  }
>>
