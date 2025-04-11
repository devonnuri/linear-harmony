\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g4.:m7 c4.:7 f2:m7 bes4:7 es2.:maj7
  }
  \new Staff \relative c' {
    \time 3/4
    bes'16 aes g f d dis e g d des c bes'
    g aes c, e g ges f es d ces bes aes
    g bes d f r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 120}
}
