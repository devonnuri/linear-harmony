\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7 a:7
  }
  \new Staff \relative c' {
    b'8 g e b dis4. b8 d b cis4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
