\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7 g:7 e:m7 a:7
    d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    \repeat volta 2 {
      r8 gis' a e g ges f a, cis e d c b d f a
      g4 f8 g16 f e4 d16 e d c
      cis4 bes'8 a~ a4 r8 g
      f g a f e d \tuplet 3/2 {f a c}
      b c d aes g f d dis
    e4~ \tuplet 3/2 {e8 g b} d b c d b g r4 r2
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
