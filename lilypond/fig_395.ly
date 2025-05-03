\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7 g:7 c:maj7 f:maj7 b:m7.5- e:7 a1:m
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      f8 a c e d b g f e g b d c a f e d f a c b gis e d c2 r
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
