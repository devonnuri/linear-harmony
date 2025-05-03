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
      g''4 es c bes a c es g f d bes a g bes d f \break
      es c a g fis a c es d2 bes g2. f4 \bar "||" \break
      es g bes d c a f es d f a c bes g es d \break
      c es g bes a fis d c bes1 bes4 d f a
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
