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
    r1 c:m7 f:7 bes
  }
  \new Staff \relative {
    \clef bass
    r2 r4 c'8 d ees ees d des c c b bes
    a4 r f'8 e ees cis d4 r r2
    \bar "||"
  }
>>
