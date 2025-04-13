\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es1:m7 aes:7 des
  }
  \new Staff \relative c' {
    r2 bes'8 ges es bes des b! c e!~ e es aes ges f r r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
