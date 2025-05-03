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
    e4 g bes d cis2 r c,4 es g bes a2 r \break
    f4 aes c es d2 r es,4 g bes d c2 r \bar "||" \break
    f,2. r4 e8 g bes d cis bes a g f2. r4 bes,8 des f aes g f es des \break
    c2. r4 e8 g bes d cis bes a g a4 c es g fis2 r \bar "||" \break
    g,2 b d f es1 g, \break
    aes2 c, es ges f1 R \bar "||" \break
    e4 g bes d cis2 r d,4 f aes c b2 r \break
    c,4 es ges bes a ges f es d1~ d \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
