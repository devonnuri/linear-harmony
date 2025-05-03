\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:maj7 e2:m7.5- a:7 d:m7 g:7 c:m7 f:7
    bes1:maj7 bes2:m7 es:7 a:m7 d:7 aes:m7 des:7
    g1:m7 c:7 f2:maj7 d:7 g:m7 c:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    \key f \major
    a'1 g8 f e d cis bes' a g f e d c b aes' g f es d c bes a ges' f es \break
    d2 r des8 c' bes aes g f es des c b' a g fis e d c ces bes' aes ges f es des ces \break
    bes4 a' g f e d' c bes a r8 g fis es' d c bes a g f e d' c bes
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
