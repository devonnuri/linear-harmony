\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    es1:m7 aes:7 des:maj7
  }
  \new Staff \relative c' {
    \tuplet 3/2 {aes'16 bes aes} g8 \tuplet 3/2 {ges bes des} e f es des
    c bes aes g ges f' r c es r4 r2
    \bar "||"
  }
>>
