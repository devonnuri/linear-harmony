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
      c4 es g bes a2. c,4 bes d f a g2. bes,4 \break
      a c es g fis2. a,4 g1~ g4 bes d f \bar "||" \break
      es2. g4 f a c es d2. f,4 es g bes d \break
      c2. es,4 d fis a c bes1 r2 d,
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
