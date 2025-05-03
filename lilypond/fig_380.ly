\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes:maj7 es:maj7
    a:m7.5- d:7.9- g:m7 r
    c1:m7 f:7 bes:maj7 es:maj7
    a:m7.5- d:7.9- g:m7 r
  }
  \new Staff \relative c' {
    \key g \minor
    \repeat volta 2 {
      es8 g bes d c bes g gis a c, es ges f es c cis
      d f a c bes a f fis g bes, d f es d c b \break
      c es g bes a g es f fis a, c es d c a c
      bes2~ bes8 d f a g2~ g8 bes d f \bar "||" \break
      es g, bes d c bes g gis a c es ges f es c cis
      d f, a c bes a f fis g bes d f es d c b \break
      c es, g bes a g es f fis a c es d a c b
      bes d, f a~ a4 bes8 g~ g2~ g8 bes, d f
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
