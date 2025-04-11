\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \time 3/4
    bes2.:m7 es:7
  }
  \relative {
    \time 3/4
    des'8 r r4 \tuplet 6/4 {des'16 c bes aes bes aes}
    g2 r4
    \bar "||"
  }
>>
