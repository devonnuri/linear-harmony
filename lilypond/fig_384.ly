\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:maj7 d:7.9- g:m7 c:7 a:m7 d:7.9- g:m7 c:7 a:m7 d:7.9- g2.:m7 c4:7 f1:maj7 f1:maj7
  }
  \new Staff \relative c' {
    \key f \major
    c'8 bes a g fis es' d c bes a g f e d' c bes a c e g fis a, c es d bes g f e c' r d
    e c a g fis g a fis g bes d f e g c, bes a c b d c a bes gis a c, r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
