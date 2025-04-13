\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
  r4 r8 c' \tuplet 3/2 {a f d} cis a c! a \tuplet 3/2 {b d f} bes aes g f fis a g f e r r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
