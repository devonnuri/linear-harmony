\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes1:m7 es:7
  }
  \new Staff \relative c' {
  bes8 f' \tuplet 3/2 {des bes f} a f' \tuplet 3/2 {des bes f} aes fis g es'~ es2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
