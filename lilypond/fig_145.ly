\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    g1:m7 c:7 f:maj7
  }
  \new Staff \relative c' {
    bes'8 fis \tuplet 3/2 {a16 bes a} fis8 g d f d
    e g bes r c aes e c
    g' e \tuplet 3/2 {f a c} e f4.
    \bar "||"
  }
>>
