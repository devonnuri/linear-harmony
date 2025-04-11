\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 a:m7 d:7 g:7
  }
  \new Staff \relative c' {
    r2 r4 a'8 b c d e g gis b a g fis e d des c e b a d!4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
