\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 g:m7 c:7 f
  }
  \new Staff \relative c' {
    r2 r4 r8 a g a bes c d f d dis e g bes c es c des b c4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
