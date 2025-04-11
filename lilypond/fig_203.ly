\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 bes:7 es
  }
  \new Staff \relative c' {
  r4 f8 g aes bes c es d des \tuplet 3/2 {c16 d c} b8 bes aes g bes es, bes es4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
