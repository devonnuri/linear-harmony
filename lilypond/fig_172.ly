\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7 bes:m7 es:7 aes1:maj7
  }
  \new Staff \relative c' {
    es'8\startGroup des c bes a\stopGroup ges' es e
    f\startGroup des bes aes g\stopGroup e' des d 
    es4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
