\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    fis2:m7 b:7 g:m7 c:7
  }
  \new Staff \relative c' {
    a'8 cis e gis fis4. r8
    bes, d f a g4. r8
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
