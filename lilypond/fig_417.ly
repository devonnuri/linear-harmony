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
    g'4 f e d cis bes' a g f2 es8 d c bes a4 g' f g \break
    aes g f es d c' bes aes g f es d c bes' aes ges \bar "||" \break
    f2 d g8 f e d cis bes' a g f1 des8 c' bes aes g f es des \break
    c2 a' g8 f e d cis bes' a bes c4 bes a g fis <<es es'>> <<d, d'>> <<c, c'>> \bar "||" \break
    <<b,2 b'>> aes g f es d' c bes \break
    c bes aes ges f es d r \bar "||" \break
    g4 f e d cis bes' a g f es d c b aes' g f \break
    es d c bes a ges' f es d1~ d \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
