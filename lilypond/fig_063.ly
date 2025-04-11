\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative {
    r8 d'' a' c~ c4. b8
    bes a g f e d c bes
    a4 r r2
    \bar "||"
  }
>>
