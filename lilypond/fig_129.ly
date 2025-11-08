\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    r1 d:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 a''8 aes \tuplet 3/2 {g16 aes g} f8 d a' \tuplet 3/2 {e f e} d c \break
    b d, f g \tuplet 3/2 {aes bes aes} g f e4 r r2
    \bar "||"
  }
>>
