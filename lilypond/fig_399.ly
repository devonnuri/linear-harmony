\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2 g:7 c:m7 f:7 d:m7 g:7 c:m7 f:7 f:m7 bes:7 es:maj7 aes:9 d:m7 g:7 c:m7 f:7 bes2
  }
  \new Staff \relative c' {
    \key bes \major
    \repeat volta 2 {
    f'8 es d c b aes g f es <<d d'>> <<c, c'>> <<bes, bes'>> <<a, a'>> <<g g'>> <<f, f'>> <<e, e'>> <<f, f'>> <<es, es'>> <<d, d'>> <<c, c'>> <<b, b'>> aes g f es <<d d'>> <<c, c'>> <<bes, bes'>> <<a, a'>> <<g g'>> <<f, f'>> <<g, g'>> <<aes, aes'>> <<g, g'>> <<f, f'>> <<es, es'>> <<d, d'>> c bes a g <<f f'>> <<es, es'>> <<d, d'>> <<c, c'>> bes aes ges f <<es es'>> <<d, d'>> <<c, c'>> <<b, b'>> aes g f es <<d d'>> <<c, c'>> <<bes, bes'>> <<a, a'>> g f es
    }
    d1
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
