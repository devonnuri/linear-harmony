\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r4. d1:m7 g:7 c:maj7 f:maj7 b:m7.5- e:7 a:m
  }
  \new Staff \relative c' {
    \partial 4. e'8 g e
    \repeat volta 2 {
      f4 e8 d~ d4. a8 c16 d c a ais8 b r a' g f e4 b8 d c g b a
      r2 r8 g' f e d4 e8 f d4 c8 b~ b4 a8 g gis f' e d c a r4 r2
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
