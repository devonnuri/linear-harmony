\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 bes:7 es:m7 aes:7
  }
  \new Staff \relative c' {
    aes'4 es'8 c~ c\startGroup aes f es d4\stopGroup r8 f aes ces aes a
    bes4 r f'8 ges\startGroup cis, d f e es des c\stopGroup r r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
