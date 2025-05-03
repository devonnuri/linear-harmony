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
    g'4 bes d f e cis a g es g bes d c a f es \break
    aes c es g f d bes aes g bes d f es c aes ges \bar "||" \break
    f2 f'8 d bes a g bes d f e cis a g f2. r4 des8 f aes c bes g es des \break
    c2 a' g8 bes d f e cis a g c4 es, g bes a fis d c \bar "||" \break
    b2 r d'4 b g f es1 c' \break
    es2 c aes ges f es d r \bar "||" \break
    g4 bes d f e cis a g f aes c es d b g f \break
    es ges bes des c a f es d1~ d \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
