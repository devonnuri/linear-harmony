\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    es1:7
  }
  \new Staff \relative c' {
    f8 des bes f aes fis g es'
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
