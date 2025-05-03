\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:maj7 e2:m7.5- a:7 d:m7 g:7 c:m7 f:7
    bes1:maj7 bes2:m7 es:7 a:m7 d:7 aes:m7 des:7
    g1:m7 c:7 f2:maj7 aes des ges
    % g1:m7 c:7 f2:maj7 d:7 g:m7 c:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    \key f \major
    c'2 r4 a8 aes g bes d f e cis a g f a c e d b g f es g bes d c a f es \break
    d2. r4 des8 f aes c bes g es des c e g b a fis d c ces es ges bes aes f des ces \break
    bes4 d f a g e c bes a r8 g aes bes c es c des f aes f ges bes des
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
