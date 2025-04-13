\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 fis2:m7 b:7
  }
  \new Staff \relative c' {
    r2 r4 r8 cis~
    cis4 e8 cis dis fis a cis
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
