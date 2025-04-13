\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2:m7 es:7 aes1:maj7
  }
  \new Staff \relative c' {
    des'8. es16 f des bes f
  \tuplet 3/2 {aes16 bes aes} f fis g es'
\tuplet 3/2 {des32 es des} b16 c4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
