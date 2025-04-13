\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    aes:m7/des
  }
  \new Staff \relative c' {
    es'8 ces aes ges f aes b es
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
