\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2:m7 es:7 aes:maj7
  }
  \new Staff \relative c' {
    bes'8 c des es f aes g f es c r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
