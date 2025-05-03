\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7 f:maj7 b:m7.5- e:7 a:m
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      r4 f8 e d f a c a ais b d aes g f dis
      e4 c8 e g b bes a~ a4 g8 f r4 r8 e
      d c b d f a f g gis e f d e b d c~
      c4 d8 e c a b c R1
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
