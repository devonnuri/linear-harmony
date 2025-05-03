\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:maj7 e2:m7.5- a:7 d:m7 g:7 c:m7 f:7
    bes1:maj7 bes2:m7 es:7 a:m7 d:7 aes:m7 des:7
    g1:m7 c:7 f:maj7 g2:m7 c:7
    % g1:m7 c:7 f2:maj7 d:7 g:m7 c:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    \key f \major
    c'2 a4 g8 a bes g e d cis e g bes a f d c b d f aes g es c bes a c es g \break
    f1 f'8 des bes aes g bes des f e c a g fis a c e es ces aes ges f aes ces es \break
    d4 bes g f e g bes d c2. c8 cis d bes g f e g bes d
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
