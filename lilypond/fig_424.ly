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
    a'2. r4 g4 bes8 g a cis e g f4 a,8 aes g b d f es4 g,8 ges f a c es \break
    d2 f, des'4 f,8 e es g bes des c4 e,8 es d fis a c ces4 es,8 d des f aes ces \break
    bes2 d, c4 e g bes a r8 es d fis a c bes4 d,8 des c e g bes
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
