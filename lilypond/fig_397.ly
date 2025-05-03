\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes1:7 es:7 bes:7 f2:m7 bes:7
    es1:7 r bes:7 d2:m7.5- g:7
    c1:m7 f:7 bes2:7 g:7 c:m7 f:7
  }
  \new Staff \relative c' {
    \key bes \major
    \repeat volta 2 {
      d2 bes8 d f aes g1 f f8 aes c es d c bes aes \break
      g1 e4 g bes des d2 f, d8 f aes c b aes g f \break
      es2 c8 es g bes a4 g f es d8 f a c b aes g f es c g' bes a g f es
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
