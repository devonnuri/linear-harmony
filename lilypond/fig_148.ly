\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d2:m7 g:7
  }
  \new Staff \relative c' {
    f32^"↓" g a c e g16 f32~^"↓" f 
    [cis16
    \set stemLeftBeamCount = 3
    \set stemRightBeamCount = 1
    e32~^"↓"
    \set stemLeftBeamCount = 1
    \set stemRightBeamCount = 3
    e
    cis
    d^"↓" a~]

    a_[c16^"↓"
    \set stemLeftBeamCount = 3
    \set stemRightBeamCount = 1
    a32~
    \set stemLeftBeamCount = 1
    \set stemRightBeamCount = 3
    a b16.^"↓"]
    r4
    \bar "||"
  }
>>
