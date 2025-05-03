\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 c:maj7 f:maj7 b:m7.5- e:7 a:m
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      a''4 e8 g f4 cis8 e d a c ais b d f a
      g4 dis8 f e b d c r4 r8 b a c e g
      f d r4 r r8 e f d b a gis b d f e c4. b8 c16 cis d8 c~ c2 r
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
