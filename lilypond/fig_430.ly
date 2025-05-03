\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2 d:7 g bes:7 es1:maj7 a2:m7 d:7
    g bes:7 es fis:7 b1 f2:m7 bes:7
    es1:maj7 a2:m7 d:7 g1:maj7 cis2:m7 fis:7
    b1:maj7 f2:m7 bes:7 es1:maj7 cis2:m7 fis:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    fis'8 dis fis gis a fis d c b4 d8 e f d bes aes g2. d'8 dis e c a g fis a c e \break
    d4. e8 f d bes aes g4 bes8 c cis ais fis e dis2. bes'8 b c aes f es d f aes c \bar "||" \break
    bes2 g4 d'8 dis e c a g fis a c e d2 b4 fis'8 g gis e cis b ais cis e gis \break
    fis2 dis4 ais8 b c aes f es d f aes c bes2 r8 es f g gis e cis b ais cis e gis
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
