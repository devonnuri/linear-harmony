\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 bes g:7 c:7
  }
  \new Staff \relative c' {
    \clef bass
    a8 g aes ges g f ges e
    f4 es8 cis d f a c
    \clef treble
    b!4. aes'8~ aes g4 f8
    e4. des'8 r c r bes
  }
>>
