\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r8 dis' e g f c cis e d f, a c b aes g f e d' c b~ b4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
