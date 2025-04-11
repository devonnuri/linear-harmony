\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c:m7 f:7 bes1
  }
  \new Staff \relative c' {
    f8 es e c b aes' g f
    es g, bes d c bes a16 c es ges f4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
