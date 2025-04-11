\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2.:m7 f:7 bes2:m7 r8. es16:7
  }
  \new Staff \relative c' {
    \time 3/4
    r8 c16\startGroup es g bes g gis a\stopGroup c es f ges f ges f es des c bes a! bes c a bes f des bes a! bes\startGroup des f aes f fis g\stopGroup
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
