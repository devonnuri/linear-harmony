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
      d'4 c bes aes g f es des d!2 f aes8 g f es d c' bes aes \break
      g2 bes des f4 es d!2 r4 r8 g f es d c b aes g f \break
      es4 d' c bes a g' f es d8 es d c b aes' g f es d c bes a g' f es
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
