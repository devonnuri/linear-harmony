\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7.5- a:7 c:m7 f:7
    f:m7 bes:7 es:maj7 aes:7
    bes:maj7 e2:m7.5- a:7 d1:m7 bes2:m7 es:7
    f1:maj7 e2:m7.5- a:7 a1:m7.5- d:7
    g:7 r c:m7 r
    aes:7 r bes:maj7 r
    e:m7.5- a:7 d:m7.5- g:7
    c:m7.5- f:7 bes:maj7
  }
  \new Staff \relative c' {
    \key bes \major
    bes'4 g e d cis e g bes g es c bes a c es g \break
    c aes f es d f aes c bes g es d c es ges bes \bar "||" \break
    a f d a' bes8 g e d cis e g bes a2 r f8 <<des des'>> <<bes, bes'>> <<aes, aes'>> <<g, g'>> <<bes, bes'>> <<des, des'>> <<f, f'>> \break
    <<e,2 e'>> <<c, c'>> bes8 g e d cis e g bes a2 es'8 c a g fis4 a c es \bar "||" \break
    d2 b g f es1 R \break
    es'2 c aes ges f1 R \bar "||" \break
    bes4 g e d cis e g bes aes f d c b d f aes \break
    ges es c bes a c es ges f1~ f \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
