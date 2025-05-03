\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c1:m7 f:7 bes:maj7 es:maj7
    a:m7.5- d:7.9- g:m7
  }
  \new Staff \relative c' {
    \key g \minor
    \repeat volta 2 {
      es'4 d c bes a g f es d c' bes a g f es d \break
      c bes' a g fis es' d c bes1~ bes2 r4 f'4
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
