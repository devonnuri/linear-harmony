\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 e:m7 a:7 d:m7 g:7
  }
  \new Staff \relative c' {
    r2 r4 r8 ais'
    \repeat volta 2 {
    \tuplet 3/2 {b f fis} a aes g des fis f e b d c cis bes' g gis \break
    \tuplet 3/2 {a dis, e} g ges f cis e es d a c ais b g' r4
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
