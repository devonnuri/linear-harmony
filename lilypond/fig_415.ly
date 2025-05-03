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
      c'4 aes f es des f aes c bes g es des c es g bes \break
      aes f des c b d f aes g1 e2. f4 \bar "||" \break
      \key es \major
      g es c bes aes c es g f d bes' aes g bes d f \break
      es c aes g fis a c es d1 b2 d \bar "||" \break
      \key g \major
      e4 c a g fis a c dis d1 b \break
      \key e \major
      cis4 a fis e dis fis a cis b2 gis dis' cis \bar "||" \break
      \key aes \major
      c4 aes f es des f aes c bes g es des c es g bes \break
      aes f des c bes2 aes' g4 es c bes b d f aes \break
      f des bes' aes g bes des f es1 des8 bes g f e g bes des
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
