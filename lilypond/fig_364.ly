\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 g'8 e f cis e cis d e f g a4 c8 ais b4 aes8 fis g4 f8 dis e b d c
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
