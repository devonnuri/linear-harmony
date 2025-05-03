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
      aes'4 c es g f des bes aes g bes des f es c aes g \break
      f aes c es d b g f e1 g2 r4 f \bar "||" \break
      \key es \major
      es g bes d c aes f es d f aes c bes g es d \break
      c es g bes a fis d c b1 d \bar "||" \break
      \key g \major
      c4 e g b a fis d c b2 d g b \break
      \key e \major
      a4 cis e gis fis dis b a gis1 gis4 e c bes \bar "||" \break
      \key aes \major
      aes c es g f des bes aes g bes des f es c aes' g \break
      f aes c es des bes ges fes es g bes es, d f aes d, \break
      des f aes c bes g es des c es g bes bes,8 des f aes g e c' bes
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
