\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    c1 a:m c a:m c a:m
  }
  \new Staff \relative c' {
    g'4 f e d c2 r2
    \bar "||"
    e4 g b d c2 r2
    \bar "||"
    b4 g e d c2 r2
    \bar "||"

  }
>>
