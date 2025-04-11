\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:m7 bes:7 es:maj7
  }
  \new Staff \relative c' {
    r4 e16 f aes c es c d bes c aes g f bes aes es c fis g aes a bes r8. r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
