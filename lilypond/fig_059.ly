\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 6))
  }
}

<<
  \chords {
    c1:m7 f:7 bes
  }
  \new Staff \relative {
    \clef bass
    ees'8 d ees d c4 r
    ees8 d c bes a f' e ees
    d4 r r2
    \bar "||"
  }
>>
