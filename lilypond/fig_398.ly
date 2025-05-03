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
      f'4 d bes aes g2. bes4 f2. d'4 c8 aes f es d f aes c \break
      bes1 des d2. f8 g aes f d c b d f aes \break
      g4 es c bes a c es g f d8 c b d f aes g es c bes a c es g
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
