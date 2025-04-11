\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7.5- g:7 c1:maj7
  }
  \new Staff \relative c' {
    d8 f aes c b aes g f e g, b d c g r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
