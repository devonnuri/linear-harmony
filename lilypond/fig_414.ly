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
      aes'2 r bes,4 des f aes g2 r aes4 c es g, \break
      f2 r g4 b d f e2 r g,4 b d f \bar "||" \break
      \key es \major
      es2 r f,4 aes c es d2 r es,4 g bes d \break
      c2 r d,4 fis a c b1 r4 g b d \bar "||" \break
      \key g \major
      c2 r d,4 fis a c b1 r4 d, g b \break
      \key e \major
      a2 r b,4 dis fis a gis1 c,4 e g bes \bar "||" \break
      \key aes \major
      aes2 r bes,4 des f aes g2 g aes4 c es g \break
      f2 r ges,4 bes des fes es2 r f,4 aes b d \break
      des2 r es,4 g bes des c1 bes4 f e r
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
