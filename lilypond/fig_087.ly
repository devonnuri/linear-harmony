\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \time 3/4
    g2.:m7.5- c:7 f:m
  }
  \new Staff \relative c' {
    \time 3/4
    c'4. bes16 aes g8 f e! g bes r c g bes aes e! g f c
    \bar "||"
  }
>>
