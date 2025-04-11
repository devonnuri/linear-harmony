\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 8))
  }
}

<<
  \chords {
    f1:m7 bes:7 es:maj7
  }
  \new Staff \relative {
    aes''8 bes c es d c bes a aes g f es d c b a bes g aes bes16 aes g4 r
    \bar "||"
  }
>>
