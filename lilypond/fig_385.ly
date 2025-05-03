\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f2:maj7 d:7.9- g:m7 c:7 a:m7 d:7.9- g:m7 c:7 a:m7 d:7.9- g2.:m7 c4:7 f1:maj7 f1:maj7
  }
  \new Staff \relative c' {
    \key f \major
    a'8 bes a g fis es d c b aes' g f e des' c bes a cis e g fis a, c es d b g f e c' r f
    e cis a g fis es' d c b g d' f e des c bes a f c' f bes, f b d c gis a f~ f4 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
