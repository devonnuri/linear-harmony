\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 bes:m7 es:7 aes:maj7
    des:maj7 g:7 c:maj7 r
    c:m7 f:m7 bes:7 es:maj7
    aes:maj7 d:7 g:maj7 r
    a:m7 d:7 g:maj7 r
    fis:m7 b:7 e:maj7 c:7
    f:m7 bes:m7 es:7 aes:maj7
    des:maj7 ges:7 c:m7 b:dim7
    bes:m7 es:7 aes:maj7 g2:m7.5- c:7
  }
  \new Staff \relative c' {
    \set Staff.explicitKeySignatureVisibility = #begin-of-line-visible
    \set Staff.printKeyCancellation = ##f
    \override Staff.KeySignature.break-visibility = #begin-of-line-visible
    \repeat volta 2 {
      \key aes \major
      aes'4 g f es des c' bes aes g f es des c bes' aes g \break
      f es des c b aes' g f e1 r2 g4 f \bar "||" \break
      \key es \major
      es d' c bes aes g f es d c' bes aes g f' es d \break
      c bes aes g fis es' d c b2 a g a4 b \bar "||" \break
      \key g \major
      c b a g fis e d c b1 d2 g4 b \break
      \key e \major
      a gis fis e dis cis' b a gis1 r4 des' c bes \bar "||" \break
      \key aes \major
      aes g f es des c' bes aes g f' es des c bes aes g \break
      f es' des c bes aes ges fes es g f es d f es d \break
      des c' bes aes g f es des c2 c' bes8 aes g f e des' c bes
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
