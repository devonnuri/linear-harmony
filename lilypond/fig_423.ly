\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:maj7 e2:m7.5- a:7 d:m7 g:7 c:m7 f:7
    bes1:maj7 bes2:m7 es:7 a:m7 d:7 aes:m7 des:7
    g1:m7 c:7 f:maj7 g2:m7 c:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    \key f \major
    a'2. g8 f e g bes d cis4 r8 e, d f a c b4 r8 d, c es g bes a ges f es \break
    d2. r8 c bes des f aes g2 a,8 c e g fis2 aes,8 ces es ges f2 \break
    g,4 bes d f e d' c bes a2. r8 fis g bes d f e d c bes
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
