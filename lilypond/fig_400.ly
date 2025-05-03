\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2 g:7 c:m7 f:7 d:m7 g:7 c:m7 f:7 f:m7 bes:7 es aes:7 d:m7.5- g:7.9- c:m7 f:7.9-
  }
  \new Staff \relative c' {
    \key bes \major
    \repeat volta 2 {
      d8 f a c b aes g f es c g' bes a g f es d f r4 r4 r8 d c es g bes a4 g8 f~ \break
      f aes c es d c bes aes g4 bes8 ges~ ges4 f8 es d f aes c b aes g f es c g' bes a ges f es
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
