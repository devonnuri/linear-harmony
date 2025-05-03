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
      f4 aes c es des2 r es,4 g bes des c2 r \break
      des,4 f aes c b2 r c,4 e g b a2 r \bar "||" \break
      \key es \major
      c,4 es g bes aes2 r bes,4 d f aes g2 r \break
      aes4 c, es g fis2 r g4 b d fis e2 r \bar "||" \break
      \key g \major
      a,4 c e g fis2 r g,4 b d fis e2 r \break
      \key e \major
      fis,4 a cis e dis2 r e,4 gis b dis cis2 c \bar "||" \break
      \key aes \major
      f,4 aes c es des2 r es,4 g bes des c2 r \break
      des,4 f aes c bes2 r c,4 es g bes aes2 r \break
      bes,4 des f aes g2 r aes4 c es aes, g8 bes des f e des c bes
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
