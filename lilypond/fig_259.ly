\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7.9- f:m7 bes:7
  }
  \new Staff \relative c' {
  g'8 es c bes a c es ges f aes, bes es d bes g f
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
