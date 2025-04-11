\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7
  }
  \relative {
    d''2 bes4. a8
    g f \tuplet 3/2 {e g bes} d a r4
    \bar "||"
  }
>>
